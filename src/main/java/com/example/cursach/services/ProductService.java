package com.example.cursach.services;

import com.example.cursach.models.Image;
import com.example.cursach.models.Product;
import com.example.cursach.models.User;
import com.example.cursach.repositories.ProductRepository;
import com.example.cursach.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;

@Service
@Slf4j
@RequiredArgsConstructor
public class ProductService {
    private final ProductRepository productRepository;
    private final UserRepository userRepository;

    public Page<Product> listProducts(String station, String town, Pageable pageable) {
        if ((station == "" && town == "")||(station == null && town == null)) return productRepository.findAll(pageable);
        if (station != "" && town != "") return productRepository.findByMetroStartsWithAndCityStartsWith(station, town, pageable);
        if (station == "" && town != "") return productRepository.findByCityStartsWith(town, pageable);
        return productRepository.findByMetroStartsWith(station, pageable);
    }

    public void saveProduct(Principal principal, Product product, MultipartFile file) throws IOException {
        product.setUser(getUserByPrincipal(principal));
        Image image;
        if (file.getSize() != 0) {
            image = toImageEntity(file);
            image.setPreviewImage(true);
            product.addImageToProduct(image);
        }
        log.info("Saving new Product. Title: {}; Author email: {}", product.getTitle(), product.getUser().getEmail());
        Product productFromDb = productRepository.save(product);
        productFromDb.setPreviewImageId(productFromDb.getImages().get(0).getId());
        productRepository.save(product);
    }

    public User getUserByPrincipal(Principal principal) {
        if (principal == null) return new User();
        return userRepository.findByEmail(principal.getName());
    }

    private Image toImageEntity(MultipartFile file) throws IOException {
        Image image = new Image();
        image.setName(file.getName());
        image.setOriginalFileName(file.getOriginalFilename());
        image.setContentType(file.getContentType());
        image.setSize(file.getSize());
        image.setBytes(file.getBytes());
        return image;
    }

    public void deleteProduct(Long id) {
        productRepository.deleteById(id);
    }

    public Product getProductById(Long id) {
        return productRepository.findById(id).orElse(null);
    }
}
