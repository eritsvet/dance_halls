<#import "blocks/template.ftlh" as t>
<#import "blocks/pager.ftlh" as p>
<@t.template user>
    <#if user.email??>
        <p class="text-info mx-auto" style="font-size: 20px; text-align: center">Добро пожаловать, <b>${user.name}!</b></p>
        <hr/>
    </#if>
    <h1 style="text-align: center">Залы</h1><hr/>
    <form method="get" action="/">
        <div class="form-row">
            <div class="form-group" style="width: 48%">
                <label for="searchWord">Поиск по метро</label>
                <input type="text" name="searchStation" <#if searchStation??>value="${searchStation}"</#if> class="form-control"
                       id="searchStation">
            </div>
            <div class="form-group" style="width: 48%; margin-left: 30px">
                <label for="searchWord">Поиск по городу</label>
                <input type="text" name="searchTown" <#if searchTown??>value="${searchTown}"</#if> class="form-control"
                       id="searchTown">
            </div>
            <input type="hidden" name="size" value=${products.getSize()}>
            <button style="width: 100%" type="submit" class="btn btn-dark">Поиск</button>
        </div>
    </form>
    <div class="card-deck d-flex justify-content-between flex-row" id="products">
        <#list products.content as product>
            <a href="/product/${product.id}" class="w-25 h-25 my-auto mx-auto">
                <div class="card text-white bg-dark my-3">
                    <img src="/images/${product.previewImageId}"
                         class="card-img-top" style="height: 200px">
                    <div class="card-body">
                        <h5 class="card-title">${product.title} | ${product.size} м²</h5>
                        <p class="card-text">${product.price} ₽</p>
                    </div>
                    <div class="card-footer">
                        <p>${product.city}, м. ${product.metro}</p>
                    </div>
                </div>
            </a>
        <#else>
            <h1 style="text-align: center">Не найдено</h1>
        </#list>
    </div>
    <@p.pager url products searchStation!"" searchTown!""/>
</@t.template>