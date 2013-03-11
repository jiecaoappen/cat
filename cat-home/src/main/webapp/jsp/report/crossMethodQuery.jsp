<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="a" uri="/WEB-INF/app.tld"%>
<%@ taglib prefix="w" uri="http://www.unidal.org/web/core"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="res" uri="http://www.unidal.org/webres"%>
<jsp:useBean id="ctx" type="com.dianping.cat.report.page.cross.Context" scope="request" />
<jsp:useBean id="payload"  	type="com.dianping.cat.report.page.cross.Payload" scope="request" />
<jsp:useBean id="model" type="com.dianping.cat.report.page.cross.Model" scope="request" />

<a:report title="Cross Report"
	navUrlPrefix="ip=${model.ipAddress}&domain=${model.domain}">

	<jsp:attribute name="subtitle">From ${w:format(model.report.startTime,'yyyy-MM-dd HH:mm:ss')} to ${w:format(model.report.endTime,'yyyy-MM-dd HH:mm:ss')}</jsp:attribute>
	<jsp:body>

<res:useCss value="${res.css.local.cross_css}" target="head-css" />
<res:useJs value="${res.js.local['jquery-1.7.1.js']}" target="head-js"/>
<%@ include file="crossQuery.jsp" %>
</br>
<table>
	<tr>
		<th>类型</th>
		<th>项目</th>
		<th>IP</th>
		<th>方法名</th>
		<th>Total</th>
		<th>Failure</th>
		<th>Failure%</th>
		<th>Avg(ms)</th>
	</tr>
	<c:forEach var="item" items="${model.info.items}" varStatus="status">
		<tr class="${status.index mod 2 != 0 ? 'odd' : 'even'}">
			<td>${item.type}</td>
			<td>${item.domain}</td>
			<td>${item.ip}</td>
			<td>${item.method}</td>
			 <td>${w:format(item.totalCount,'#,###,###,###,##0')}</td>
		     <td>${w:format(item.failureCount,'#,###,###,###,##0')}</td>
		     <td>${w:format(item.failurePercent,'0.00%')}</td>
		     <td>${w:format(item.avg,'0.00')}</td>
		</tr>
	</c:forEach>
</table>
</br>
</jsp:body>
</a:report>
