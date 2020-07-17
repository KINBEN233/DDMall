<%--
  Created by IntelliJ IDEA.
  User: 84537
  Date: 2020/6/19
  Time: 15:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>

<div>
    <span style="position:absolute;left: 220px;top:5px">
    <a href="forehome">
        <img id="simpleLogo" class="simpleLogo" src="img/site/simpleLogo.jpg" width="120" height="20">
    </a>
    </span>
    <form style="padding-right: 200px" action="foresearch" method="post" >
        <div class="simpleSearchDiv pull-right">
            <input type="text" placeholder="手办 挂画" name="keyword">
            <button class="searchButton" type="submit">搜DD</button>
            <div class="searchBelow">
                <c:forEach items="${cs}" var="c" varStatus="st">
                    <c:if test="${st.count>=8 and st.count<=11}">
                    <span>
                        <a href="forecategory?cid=${c.id}">
                                ${c.name}
                        </a>
                        <c:if test="${st.count!=11}">
                            <span>|</span>
                        </c:if>
                    </span>
                    </c:if>
                </c:forEach>
            </div>
        </div>
    </form>
    <div style="clear:both"></div>
</div>