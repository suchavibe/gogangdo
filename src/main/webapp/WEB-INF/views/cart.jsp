<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
        .main_container{
            width: 1200px;
            text-align: center;
            margin: 0px auto;
            display: flex;
            flex-direction: column;
            border-top: solid 1px gray;
        }
        .sub_header{
            width: 1200px;
            margin: 20px auto;
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            border-bottom: solid 1px gray;
        }
        #step{
            font-size: 14px;
            display: flex;
            flex-direction: row;
            margin-top: 20px;
        }
        #step p{
            margin: 0px 5px;
        }
        .cart_list{
            width: 1200px;
            border-collapse: collapse;
        }
        /*.cart_list thead{
            background-color: lightgray;
        }*/
        .cart_list tr{
            border-bottom: solid 1px lightgray;
        }
        /*.cart_list td{
            border: solid 1px lightgray;
        }*/
        .cart_list img{
            width: 50px;
            height: 50px;
        }
        .cart_total{
            width: 1200px;
            margin: 10px auto;
        }
        .total{
            width: 1200px;
            margin: 10px auto;
            background-color: #e9e9e9;
        }
        .total img{
            width: 25px;
            height: 25px;
            margin-bottom: 15px;
        }
        .total td{
            width: 20%;
            text-align: center;
        }
        #price td{
            font-weight: bold;
        }
        #choose{
        	float: left;
            margin: 20px 10px;
        }
        #choose button{
            width: 150px;
            height: 30px;
            font-size: 14px;
            background-color: gray;
            color: white;
            border: none;
        }
         #delete_choose a{
        	text-decoration: none;
        	color: white;
        }
        #continue{
            text-align: center;
            margin: 20px;
        }
        #continue button{
            width: 200px;
            height: 50px;
            font-size: 20px;
            border: none;
            background-color: black;
        }
        #continue button a{
        	text-decoration: none;
            color: white;
        }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
    $('#order_btn').click(function(){
        var id = '${sessionScope.id}';
       location.href= "orderCartProduct.do?id="+id;
    });
 });
</script>
</head>
<body>
<c:if test="${sessionScope.login == null || sessionScope.login == false  }">
	<script>
		alert("???????????? ????????? ???????????? ????????????.");
		location.href="loginView.do";
	</script>
</c:if>
<jsp:include page="include/header.jsp"></jsp:include>
	<div class="main_container">
        <div class="sub_header">
            <h3>????????????</h3>
            <div id="step">
                <p style="font-weight:bold">01.????????????</p>
                <p>>></p>
                <p>02.????????? ??????/??????</p>
                <p>>></p>
                <p>03.????????????</p>
            </div>
        </div>
        <table class="cart_list">
        <c:choose>
        <c:when test="${requestScope.cart_count == 0 }">
        <th style="padding:30px 0px;font-size:20px">??????????????? ??????????????????</th>
        </c:when>
        <c:otherwise>
            <thead style="height:30px">
                <th>????????????</th>
                <th>??????</th>
                <th>?????? ??????</th>
                <th>?????? ??????</th>
                <th>??????</th>
            </thead>
        	<tbody class="cart_product">
            	<c:forEach var="cart" items="${requestScope.cart }">
            		<tr style="height:70px">
             			<td style="font-size:14px;color:gray"><img alt="" src="imageLoad.do?fno=${cart.img_no }">${cart.product_name }</td>
                		<td id="ea">${cart.cart_ea }</td>
                		<td>${cart.product_price }</td>
                		<td id="total_price">${cart.cart_ea*cart.product_price }</td>
                		<td><a href="cartDelete.do?cart_no=${cart.cart_no }" style="text-decoration:none;color:darkgray">??????</a></td>
            		</tr>
            	</c:forEach>
            </tbody>
        </c:otherwise>
        </c:choose>
        </table>
        <form action="#" class="cart_total">
                <table class="total">
                    <tr>
                        <td></td>
                        <td></td>
                        <td>??? ????????????</td>
                        <td>?????????</td>
                        <td>??????</td>
                    </tr>
                    <tr >
                        <td></td>
                        <td></td>
                        <td>${requestScope.all_price }???</td>
                        <td>3,000???</td>
                        <td id="cart_price">${requestScope.cart_price }???</td>
                    </tr>
                </table>   
            <div id="continue">
                <button><a href="productList.do?category_no=0">?????? ????????????</a></button>
                <button type="button" id="order_btn" style="color:white">????????????</button>
            </div>
        </form>
    </div>
<jsp:include page="include/footer.jsp"></jsp:include>
</body>
</html>