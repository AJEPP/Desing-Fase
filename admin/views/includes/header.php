<link rel="stylesheet" href="http://<?php echo $_SERVER['SERVER_NAME'];?>/views/assets/css/fontawesome.css">
<!-- <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.0/css/all.css"> -->

<!-- <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet"> -->
<link rel="stylesheet" type="text/css" href="http://<?php echo $_SERVER['SERVER_NAME'];?>/views/assets/css/datatable.css"/>
<!-- Custom styles for this template-->
<link href="http://<?php echo $_SERVER['SERVER_NAME'];?>/views/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="http://<?php echo $_SERVER['SERVER_NAME'];?>/views/assets/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
<link href="http://<?php echo $_SERVER['SERVER_NAME'];?>/views/assets/css/component-chosen.min.css" rel="stylesheet">
<link href="http://<?php echo $_SERVER['SERVER_NAME'];?>/views/assets/css/datatable.css" rel="stylesheet">
<link href="http://<?php echo $_SERVER['SERVER_NAME'];?>/views/assets/css/fileinput.css" rel="stylesheet">
<link href="http://<?php echo $_SERVER['SERVER_NAME'];?>/views/assets/css/theme.css" rel="stylesheet">
<link href="http://<?php echo $_SERVER['SERVER_NAME'];?>/views/assets/css/bs-stepper.min.css" rel="stylesheet">


<!-- AutoComplete -->

<link href="http://<?php echo $_SERVER['SERVER_NAME'];?>/views/assets/css/easy-autocomplete.min.css" rel="stylesheet">
<!-- <link href="http://<?php echo $_SERVER['SERVER_NAME'];?>/views/assets/css/easy-autocomplete.themes.min.css" rel="stylesheet"> -->


<style>

    .hide
    {
        display: none !important;
    }

    /* #item-list .btn {
        width: 16.6%;
        text-align: center;
    }

    #item-list .btn-both .bg-img {
        background: #FFF;
        height: 140px;
    }

    .bg-img
    {
        width: 100%;
    }
    .bg-img img {
        width: 100%;
        height: 100%;
    }

    #item-list .btn-both span {
        display: block;
        width: 100%;
        background: #E5E5E5;
        height: 40px;
        overflow: hidden;
        white-space: pre-wrap;
        margin-left: 1px;
    }

    #item-list .btn-both span span {
    display: table-cell;
    vertical-align: middle;
    overflow: hidden;
    white-space: pre-wrap;
    line-height: 16px;
    padding: 3px 2px;
}
.btn.btn-flat {
    border-radius: 0;
    -webkit-box-shadow: none;
    -moz-box-shadow: none;
    box-shadow: none;
    border-width: 1px;
} */

#item-list .btn{width:120px;text-align:center}
#item-list .items{height:100%;position:relative;overflow:hidden}
#item-list .btn-name{width:116px;height:60px;line-height:16px;white-space:pre-wrap;margin:2px}#item-list .btn-both,#item-list .btn-img{background:0 0;padding:3px}
#item-list .btn-both:hover,
#item-list .btn-img:hover{background:#CCC}
#item-list .btn-both .bg-img{background:#FFF;height:110px;padding:5px}
#item-list .btn-both span{display:block;width:110px;background:#E5E5E5;height:40px;overflow:hidden;/* white-space:pre-wrap; */margin-left:1px}
#item-list .btn-both span span{display:table-cell;vertical-align:middle;overflow:hidden;white-space:pre-wrap;line-height:16px;padding:3px 2px}

/*the container must be positioned relative:*/
.autocomplete {
  position: relative;
  display: inline-block;
}

input {
  border: 1px solid transparent;
  background-color: #f1f1f1;
  padding: 10px;
  font-size: 16px;
}

input[type=text] {
  background-color: #f1f1f1;
  width: 100%;
}

input[type=submit] {
  background-color: DodgerBlue;
  color: #fff;
  cursor: pointer;
}

.autocomplete-items {
  position: absolute;
  border: 1px solid #d4d4d4;
  border-bottom: none;
  border-top: none;
  z-index: 99;
  /*position the autocomplete items to be the same width as the container:*/
  top: 100%;
  left: 0;
  right: 0;
}

.autocomplete-items div {
  padding: 10px;
  cursor: pointer;
  background-color: #fff; 
  border-bottom: 1px solid #d4d4d4; 
}

/*when hovering an item:*/
.autocomplete-items div:hover {
  background-color: #e9e9e9; 
}

/*when navigating through the items using the arrow keys:*/
.autocomplete-active {
  background-color: DodgerBlue !important; 
  color: #ffffff; 
}

.nav-item a.active
{
  background-color: rgba(0,0,0,0.3);
  color: #fff;
}
.chosen-container-single .chosen-single {
  height: calc(2.02rem + 2px) !important;
}

.chosen-container-active.chosen-with-drop .chosen-single div:after 
{
  top: 0.1rem !important;
}

.chosen-container-single .chosen-single div:after {
  top: 0.1rem !important;
}

#product_list td
{
  font-size: 0.9em;
}

#product_list td input {
    border: 1px solid transparent;
    background-color: #f1f1f1;
    padding: 2px;
    font-size: 0.9em;
    width: 50px;
    text-align: center;
}
/* .collapse-item .active
{
  background-color: black;
  opacity: 0.3;
  color: #fff;
} */
</style>