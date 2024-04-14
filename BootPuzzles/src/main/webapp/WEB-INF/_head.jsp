<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Puzzle - Wordsearch</title>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.13/css/all.css"
	integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous" />
<link href="https://fonts.googleapis.com/css?family=Abel|Anton"
	rel="stylesheet">

<link rel="icon" type="image/png" href="favicon.png" />

<style>
* {
	font-family: Courier, monospace;
	font-size: 12px;
}

table {
	border-collapse: collapse;
	width: 100%;
	margin: 2px;
	background-color: #F5F5F5;
	border-radius: 0.5rem;
	padding-top: 5px;
	padding-bottom: 5px;
}

tr {
	height: 24px;
}

th, td {
	width: 10px;
	text-align: center;

}

.row {
	margin: 2px;
	padding: 2px;
}

input[type="number"] {
	width: 100%;
}

input[type="text"] {
	width: 100%;
}

input[type="file"] {
	width: 100%;
}

.a, .b, .c, .d, .e, .f, .g, .h, .i, .j, .k, .l, .m, .n, .o, .p, .q, .r,
	.s, .t, .u, .v, .w, .x, .y, .z {
	color: black;
}

.A, .B, .C, .D, .E, .F, .G, .H, .I, .J, .K, .L, .M, .N, .O, .P, .Q, .R,
	.S, .T, .U, .V, .W, .X, .Y, .Z {
	color: tomato;
}

img {
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1), 0 1px 3px rgba(0, 0, 0, 0.18);
	border-radius: 0.5rem;
}

img {
	transition: transform 0.25s;
}

img:hover {
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1), 0 3px 9px rgba(0, 0, 0, 0.98);
}
</style>

</head>
