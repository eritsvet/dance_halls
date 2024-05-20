<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Личный кабинет пользователя ${user.name}</h1>
    <hr>
    <br>
    <div style="text-align: center">
        Электоронная почта: <b>${user.email}</b>
        <br>
        Номер телефона: <b>${user.numberPhone}</b>
        <br>
        <br>
        <h4 style="text-align: center">Бронирования</h4>
                <table class="table table-bordered table-hover">
                    <thead class="thead-dark">
                    <tr style="vertical-align: middle;text-align: center;">
                        <th style="vertical-align: middle">Зал</th>
                        <th style="vertical-align: middle">Адрес</th>
                        <th style="vertical-align: middle">Дата</th>
                        <th style="vertical-align: middle">Время</th>
                        <th style="vertical-align: middle">Цена</th>
                        <th style="vertical-align: middle">Удаление</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#list events as event>
                        <#if event.username?? && user.name == event.username>
                        <tr style="vertical-align: middle;text-align: center;">
                            <th>${event.name}</th>
                            <th>${event.address}</th>
                            <th>${event.date}</th>
                            <th>${event.time}</th>
                            <th>${event.price}₽</th>
                            <th>
                                <form action="/product/deleteEvent/${event.id}" method="post">
                                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                                    <input type="submit" value="Удалить">
                                </form>
                            </th>
                        </tr>
                        </#if>
                    <#else>
                        <tr>
                            <td colspan="6"><h3>Записей нет</h3></td>
                        </tr>
                    </#list>
                    </tbody>
                </table><br>
</@t.template>