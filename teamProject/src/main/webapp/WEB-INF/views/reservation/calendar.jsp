<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<html>
<head>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	<script src="//code.jquery.com/jquery.min.js"></script>
	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
	<link rel="stylesheet" href="//cdn.rawgit.com/fgelinas/timepicker/master/jquery.ui.timepicker.css">
	<script src="//cdn.rawgit.com/fgelinas/timepicker/master/jquery.ui.timepicker.js"></script>
</head>
<body>

 	<script>
$(function() {
  $( "#chDate" ).datepicker({
    dateFormat: 'yy/mm/dd',
    prevText: '이전 달',
    nextText: '다음 달',
    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    dayNames: ['일','월','화','수','목','금','토'],
    dayNamesShort: ['일','월','화','수','목','금','토'],
    dayNamesMin: ['일','월','화','수','목','금','토'],
    showMonthAfterYear: true,
    changeMonth: true,
    changeYear: true,
    yearSuffix: '년',
    minDate: 1,
    onSelect:function(d){
    	var arr = d.split("/");
    	var year = arr[0];
    	var month = arr[1];
    	var day = arr[2];
    	
    	$("#year").text(year);
    	$("#month").text(month);
    	$("#day").text(day);
    	
    	
    }
  
  });
	

	$('.chHour').timepicker({
	
	timeFormat: 'HH:MM',
	minTime: '10:00',
	maxTime: '21:00',
	StartTime: '10:00',
	hourNames: ['10','11','12','13','14','15','16','17','18','19','20'],
	hourNamesShort: ['10','11','12','13','14','15','16','17','18','19','20'],
	minutesNames: ['00','05','10','15','20','25','30','35','40','45','50','55'],
	minutesNamesShort: ['00','05','10','15','20','25','30','35','40','45','50','55'],
	minutesNamesMin: ['00','05','10','15','20','25','30','35','40','45','50','55'],
	
	dynamic: false,
	dropdown: true,
	
	
	
	 onSelect:function(d){
	    	var arr = d.split("/");
	    	var hour = arr[0];
	    	var minutes = arr[1];
	    	
	    	
	    	$("#hour").text(hour);
	    	$("#minutes").text(minutes);
	    
	    	
	    	
	    }
	
});
});
</script>
</body>
</html>
