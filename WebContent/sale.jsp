<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
     <%@ page import="java.sql.Date" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/buy.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>卖货管理</title>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script  charset="UTF-8" language="javascript" type="text/javascript" src="js/buy.js"  >
</script>
</head>
<body>

	<!-- 检查登录 -->
	<jsp:include page="checkLogin.jsp"/>

	<jsp:include page="admin.jsp"></jsp:include>
	
	<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<h3 class="text-center">
				卖货记录
			</h3>
			<table class="table">
				<thead>
					<tr>
						<th>
							编号
						</th>
						<th>
							日期
						</th>
						<th>
							客户
						</th>
						<th>
							货品名
						</th>
						<th>
							重量（公斤）
						</th>
						<th>
							磅费（元）
						</th>
						<th>
							收入金额（元）
						</th>
						<th>
							备注
						</th>
						<th>
							操作
						</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${sales}" var="sale">
				<form action="updateSaleServlet?sale_id=${sale.getSale_id()}" method="POST">
					<tr class="success">
						<td>
						<c:out value="${sale.getSale_id()}"></c:out>
						</td>
						<td>
							<input class="date" type="text" value="${sale.getDate()}"name="date">
						</td>
						<td>
							<input type="text" value="${sale.getCustomer()}"name="customer">
						</td>
						<td>
							<input type="text" value="${sale.getGoods()}"name="goods">
						</td>
						<td>
							<input type="text" value="${sale.getWeight()}"name="weight">
						</td>
						<td>
							<input class="weigh_money"type="text" value="${sale.getWeigh_money()}"name="weigh_money">
						</td>
						<td>
							<input class="money" type="text" value="${sale.getMoney()}"name="money">
						</td>
						<td>
							<input class="remarks"type="text" value="${sale.getRemarks()}"name="remarks">
						</td>
						<td class="subdel">
							<input type="submit" value="修改"><a class="delete" onclick="return del()" href="delSaleServlet?sale_id=${sale.getSale_id()}">删除</a>
						</td>
					</tr>
					</form>
				</c:forEach>
					<form class="hidden_form" action="addSaleServlet" method="POST">
					<tr class="hidden_tr">
						<td>
						</td>
						<td>
							<input class="date" type="text" value="2018-01-01" name="date">
						</td>
						<td>
							<input type="text" name="customer">
						</td>
						<td>
							<input type="text" name="goods">
						</td>
						<td>
							<input type="text" name="weight">
						</td>
						<td>
							<input type="text" name="weigh_money">
						</td>
						<td>
							<input  type="text" name="money">
						</td>
						<td>
							<input class="remarks"type="text" name="remarks">
						</td>
						<td width="10%">
							<input type="submit" value="提交">
						</td>
					</tr>
					</form>
				</tbody>
				<tfoot>
					<tr class="warning">
						<td></td><td><font>页面总计</font></td><td></td><td></td>
						<td></td><td><font class="totolW"></font><font>.0元</font></td><td><font class="totolM"></font><font>.0元</font></td><td></td><td></td>
					</tr>
				</tfoot>
			</table>
			<div align="center"><button class="newBuy" >新增</button></div>
			<div class="row clearfix">
				<div class="col-md-3 column">
				</div>
				<div class="col-md-8 column">
					<ul class="pagination">
						<li>
							 <a href="ShowSaleServlet?page=1">首页</a>
						</li>
						<li>
							 <a href="ShowSaleServlet?last=yes">上一页</a>
						</li>
						<li>
							 <a>当前页：${SalePageHelper.getPage()}</a>
						</li>
						<c:forEach  var="page" begin="1" end="${SalePageHelper.getMaxPage()}">
						<li>
							 <a href="ShowSaleServlet?page=${page}">${page}</a>
						</li>
						</c:forEach>
						<li>
							 <a href="ShowSaleServlet?next=yes">下一页</a>
						</li>
						<li>
							 <a href="ShowSaleServlet?page=${SalePageHelper.getMaxPage()}">最后一页</a>
						</li>
					</ul>
				</div>
				<div class="col-md-1 column">
				</div>
			</div>
		</div>
	</div>
</div>
	
</body>
</html>