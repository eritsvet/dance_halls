<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center" class="my-3">Подробная информация о зале</h1>
    <hr>
    <#list images as img>
        <img class="img-fluid mx-auto d-block img-thumbnail" src="/images/${img.id}" style="height:400px;"/><br><br>
    </#list>
    <hr>
    <p><h1 style="text-align: center">${product.title} | ${product.size} м²</h1></p>
    <p><h3 style="text-align: center">${product.city}, м. ${product.metro}</h3></p>
    <p><h3 style="text-align: center">${product.address}</h3></p>
    <p><h3 style="text-align: center">${product.price} ₽</h3></p>
    <p><h3 style="text-align: center">Номер телефона студии: <b>${product.user.numberPhone} </b> </h3></p>
    <h4 style="text-align: center">Мои записи</h4>

    <hr>
    <div class="d-block">
        <a class="btn btn-dark mt-3 mb-3" style="text-align: center; width: 100%"
           data-toggle="collapse" href="#collapseExample" role="button"
           aria-expanded="true" aria-controls="collapseExample">
            Забронировать
        </a>
        <div class="collapse mb-3" id="collapseExample" style="">
            <form action="/product/createEvent/" method="post" enctype="multipart/form-data">
                <input type="hidden" name="user" value="${user.id}">
                <input type="hidden" name="username" value="${user.name}">
                <input type="hidden" name="price" value="${product.price?replace(" ", "")}">
                <input type="hidden" name="name" value="${product.title}">
                <input type="hidden" name="address" value="${product.address}">
                <div>
                <label>Дата </label>
                <input type="date" class="form-control" name="date" />
                </div><br>
                <div class="form-group">
                    <label for="Time">Время</label>
                    <select id="Time" required name="time" class="form-control">

                        <option value="">Время не выбрано</option>
                        <option value="10:00-12:00">10:00-12:00</option>
                        <option value="12:00-14:00">12:00-14:00</option>
                        <option value="14:00-16:00">14:00-16:00</option>
                        <option value="16:00-18:00">16:00-18:00</option>
                        <option value="18:00-20:00">18:00-20:00</option>
                        <option value="20:00-22:00">20:00-22:00</option>

                    </select>
                </div>
                <div>
                    <label for="Price">Цена</label>
                    <div class="mb-3">
                        <p>${product.price}₽</p>
                    </div>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>

                <button type="submit" style="width: 100%" class="btn btn-dark">Сохранить</button>
            </form>
        </div>
    </div>

</@t.template>