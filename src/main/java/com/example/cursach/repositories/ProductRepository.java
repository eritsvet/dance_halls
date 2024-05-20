package com.example.cursach.repositories;

import com.example.cursach.models.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductRepository extends JpaRepository<Product, Long> {
    Page<Product> findByMetroStartsWith(String station, Pageable pageable);
    Page<Product> findAll(Pageable pageable);
    Page<Product> findByCityStartsWith(String town, Pageable pageable);
    Page<Product> findByMetroStartsWithAndCityStartsWith(String station, String town, Pageable pageable);
}
