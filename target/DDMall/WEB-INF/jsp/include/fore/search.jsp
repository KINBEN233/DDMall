<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>


<a href="forehome">
    <img id="simpleLogo" src="img/site/simpleLogo.jpg" width="200" height="50" style="position: absolute;top:50px;left: 30px">
</a>

<form action="foresearch" method="post" >
    <div class="searchDiv">
        <input name="keyword" type="text" value="${param.keyword}" placeholder="手办  挂画 ">
        <button type="submit" class="searchButton">搜索</button>
        <div class="searchBelow">
            <c:forEach items="${cs}" var="c" varStatus="st">
                <c:if test="${st.count>=5 and st.count<=8}">
                        <span>
                            <a href="forecategory?cid=${c.id}">
                                    ${c.name}
                            </a>
                            <c:if test="${st.count!=8}">
                                <span>|</span>
                            </c:if>
                        </span>
                </c:if>
            </c:forEach>
        </div>
    </div>
</form>
