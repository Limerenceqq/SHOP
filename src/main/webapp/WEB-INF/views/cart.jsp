<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ page isELIgnored="false" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>购物车</title>
    <link rel="stylesheet" href="${path}/css/reset.css">
    <link rel="stylesheet" href="${path}/css/carts.css">
</head>
<body>
<c:if test="${sessionScope.cart.cartItems.size()==0}">
    <br/><br/><br/><br/>
    <div class="step step1">
        <h2 align="center" style="color: #cc0000">您还没有购物!</h2><br/><br/>
    </div>
    <a href="${path}/home/index"><h2 align="center" style="color: #cc0000">去购物！>>>></h2></a>
</c:if>
<c:if test="${sessionScope.cart.cartItems.size()>0}">
    <section class="cartMain">
        <form action="${path}/order/submitOrders" method="post">
            <div class="cartMain_hd">
                <ul class="order_lists cartTop">
                    <li class="list_chk">
                        <!--所有商品全选-->
                        <input type="checkbox" id="all" class="whole_check">
                        <label for="all"></label>
                        全选
                    </li>
                    <li class="list_con">商品信息</li>
                    <%--<li class="list_info">商品参数</li>--%>
                    <li class="list_price">单价</li>
                    <li class="list_amount">数量</li>
                    <li class="list_sum">金额</li>
                    <li class="list_op">操作</li>
                </ul>
            </div>
            <c:set var="i" value="1"/>
            <c:forEach items="${sessionScope.cart.cartItems}" var="cartItems">
                <div class="cartBox">
                    <div class="order_content">
                        <ul class="order_lists">
                            <li class="list_chk">
                                <input type="checkbox" id="checkbox_${i}" value="${cartItems.product.pid}" name="checked" class="son_check">
                                <label for="checkbox_${i}"></label>
                            </li>
                            <li class="list_con">
                                <div class="list_img">
                                    <a href="${path}/product/findProductByPid?pid=${cartItems.product.pid}">
                                        <img src="${path}/${cartItems.product.image}" alt=""/>
                                    </a>
                                </div>
                                <div class="list_text">
                                    <a href="${path}/product/findProductByPid?pid=${cartItems.product.pid}">${cartItems.product.pname}</a>
                                </div>
                            </li>
                            <li class="list_price">
                                <p class="price">￥${cartItems.product.shopPrice}</p>
                            </li>
                            <li class="list_amount">
                                <div class="amount_box">
                                    <a href="javascript:;" class="reduce reSty">-</a>
                                    <input type="text" name="pid" id="pid" value="${cartItems.product.pid}" hidden="hidden" />
                                    <input type="text" value="${cartItems.count}" class="sum"/>
                                    <a href="javascript:;" class="plus">+</a>
                                </div>
                            </li>
                            <li class="list_sum">
                                <p class="sum_price">￥${cartItems.count*cartItems.product.shopPrice}</p>
                            </li>
                            <li class="list_op">
                                <p class="del">
                                    <a href="${path}/cart/removeCartItem?pid=${cartItems.product.pid}" class="delBtn">移除商品</a>
                                </p>
                            </li>
                        </ul>
                    </div>
                </div>
                <c:set var="i" value="${i+1}"/>
            </c:forEach>
            <!--底部-->

            <div class="bar-wrapper">
                <div class="bar-right">
                    <div class="piece">已选商品<strong class="piece_num">0</strong>件</div>
                    <div class="totalMoney">共计: <strong class="total_text">0.00</strong></div>
                    <div class="calBtn">
                        <input type="submit" value="提交订单" style="display: block;
                                                                width: 110px;
                                                                height: 50px;
                                                                color: white;
                                                                background: #d80000;
                                                                font-size: 22px;
                                                                letter-spacing: 5px;
                                                                text-decoration: none;
                                                                line-height: 50px;
                                                                text-align: center;
                                                                border-radius: 2px;">
                    </div><span style="color: #d80000">${msg}</span>
                </div>
            </div>
        </form>
    </section>
</c:if>
<section class="model_bg"></section>

<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<script>
    $(function () {
        //全局的checkbox选中和未选中的样式
        var $allCheckbox = $('input[type="checkbox"]'),     //全局的全部checkbox
            $wholeChexbox = $('.whole_check'),
            $cartBox = $('.cartBox'),                       //每个商铺盒子
            $shopCheckbox = $('.shopChoice'),               //每个商铺的checkbox
            $sonCheckBox = $('.son_check');                 //每个商铺下的商品的checkbox
        $allCheckbox.click(function () {
            if ($(this).is(':checked')) {
                $(this).next('label').addClass('mark');
            } else {
                $(this).next('label').removeClass('mark')
            }
        });

        //===============================================全局全选与单个商品的关系================================
        $wholeChexbox.click(function () {
            var $checkboxs = $cartBox.find('input[type="checkbox"]');
            if ($(this).is(':checked')) {
                $checkboxs.prop("checked", true);
                $checkboxs.next('label').addClass('mark');
            } else {
                $checkboxs.prop("checked", false);
                $checkboxs.next('label').removeClass('mark');
            }
            totalMoney();
        });


        $sonCheckBox.each(function () {
            $(this).click(function () {
                if ($(this).is(':checked')) {
                    //判断：所有单个商品是否勾选
                    var len = $sonCheckBox.length;
                    var num = 0;
                    $sonCheckBox.each(function () {
                        if ($(this).is(':checked')) {
                            num++;
                        }
                    });
                    if (num == len) {
                        $wholeChexbox.prop("checked", true);
                        $wholeChexbox.next('label').addClass('mark');
                    }
                } else {
                    //单个商品取消勾选，全局全选取消勾选
                    $wholeChexbox.prop("checked", false);
                    $wholeChexbox.next('label').removeClass('mark');
                }
            })
        })

        //=======================================每个店铺checkbox与全选checkbox的关系/每个店铺与其下商品样式的变化===================================================

        //店铺有一个未选中，全局全选按钮取消对勾，若店铺全选中，则全局全选按钮打对勾。
        $shopCheckbox.each(function () {
            $(this).click(function () {
                if ($(this).is(':checked')) {
                    //判断：店铺全选中，则全局全选按钮打对勾。
                    var len = $shopCheckbox.length;
                    var num = 0;
                    $shopCheckbox.each(function () {
                        if ($(this).is(':checked')) {
                            num++;
                        }
                    });
                    if (num == len) {
                        $wholeChexbox.prop("checked", true);
                        $wholeChexbox.next('label').addClass('mark');
                    }

                    //店铺下的checkbox选中状态
                    $(this).parents('.cartBox').find('.son_check').prop("checked", true);
                    $(this).parents('.cartBox').find('.son_check').next('label').addClass('mark');
                } else {
                    //否则，全局全选按钮取消对勾
                    $wholeChexbox.prop("checked", false);
                    $wholeChexbox.next('label').removeClass('mark');

                    //店铺下的checkbox选中状态
                    $(this).parents('.cartBox').find('.son_check').prop("checked", false);
                    $(this).parents('.cartBox').find('.son_check').next('label').removeClass('mark');
                }
                totalMoney();
            });
        });


        //========================================每个店铺checkbox与其下商品的checkbox的关系======================================================

        //店铺$sonChecks有一个未选中，店铺全选按钮取消选中，若全都选中，则全选打对勾
        $cartBox.each(function () {
            var $this = $(this);
            var $sonChecks = $this.find('.son_check');
            $sonChecks.each(function () {
                $(this).click(function () {
                    if ($(this).is(':checked')) {
                        //判断：如果所有的$sonChecks都选中则店铺全选打对勾！
                        var len = $sonChecks.length;
                        var num = 0;
                        $sonChecks.each(function () {
                            if ($(this).is(':checked')) {
                                num++;
                            }
                        });
                        if (num == len) {
                            $(this).parents('.cartBox').find('.shopChoice').prop("checked", true);
                            $(this).parents('.cartBox').find('.shopChoice').next('label').addClass('mark');
                        }

                    } else {
                        //否则，店铺全选取消
                        $(this).parents('.cartBox').find('.shopChoice').prop("checked", false);
                        $(this).parents('.cartBox').find('.shopChoice').next('label').removeClass('mark');
                    }
                    totalMoney();
                });
            });
        });


        //=================================================商品数量==============================================
        var $plus = $('.plus'),
            $reduce = $('.reduce'),
            $all_sum = $('.sum');
        $plus.click(function () {
            var $pid = $(this).prev().prev(),
                $inputVal = $(this).prev('input'),
                $count = parseInt($inputVal.val())+1,
                $obj = $(this).parents('.amount_box').find('.reduce'),
                $priceTotalObj = $(this).parents('.order_lists').find('.sum_price'),
                $price = $(this).parents('.order_lists').find('.price').html(),  //单价
                $priceTotal = $count*parseInt($price.substring(1));
            $inputVal.val($count);
            $priceTotalObj.html('￥'+$priceTotal);
            if($inputVal.val()>1 && $obj.hasClass('reSty')){
                $obj.removeClass('reSty');
            }
            totalMoney();
            $.ajax({
                type: "get",
                url: "${path}/cart/plus",
                data: {
                    pid: $pid.val()
                },
                success: function (data) {
                }
            });
        });

        $reduce.click(function () {
            var $pid = $(this).next(),
                $inputVal = $(this).next().next(),
                $count = parseInt($inputVal.val())-1,
                $priceTotalObj = $(this).parents('.order_lists').find('.sum_price'),
                $price = $(this).parents('.order_lists').find('.price').html(),  //单价
                $priceTotal = $count*parseInt($price.substring(1));
            if($inputVal.val()>1){
                $inputVal.val($count);
                $priceTotalObj.html('￥'+$priceTotal);
            }
            if($inputVal.val()==1 && !$(this).hasClass('reSty')){
                $(this).addClass('reSty');
            }
            totalMoney();
            $.ajax({
                type: "get",
                url: "${path}/cart/minus",
                data: {
                    pid: $pid.val()
                },
                success: function (data) {
                }
            });
        });

        $all_sum.keyup(function () {
            var $pid = $(this).prev(),
                $count = 0,
                $priceTotalObj = $(this).parents('.order_lists').find('.sum_price'),
                $price = $(this).parents('.order_lists').find('.price').html(),  //单价
                $priceTotal = 0;
            if($(this).val()==''){
                $(this).val('1');
            }
            $(this).val($(this).val().replace(/\D|^0/g,''));
            $count = $(this).val();
            $priceTotal = $count*parseInt($price.substring(1));
            $(this).attr('value',$count);
            $priceTotalObj.html('￥'+$priceTotal);
            totalMoney();
            $.ajax({
                type: "get",
                url:"${path}/cart/changeCount",
                data: {
                    pid: $pid.val(),
                    count: $count
                },
                success: function (data) {
                }
            });
        })

        //======================================移除商品========================================

        var $order_lists = null;
        var $order_content = '';
        $('.delBtn').click(function () {
            $order_lists = $(this).parents('.order_lists');
            $order_content = $order_lists.parents('.order_content');
            $('.model_bg').fadeIn(300);
            $('.my_model').fadeIn(300);
        });

        //关闭模态框
        $('.closeModel').click(function () {
            closeM();
        });
        $('.dialog-close').click(function () {
            closeM();
        });
        function closeM() {
            $('.model_bg').fadeOut(300);
            $('.my_model').fadeOut(300);
        }
        //确定按钮，移除商品
        $('.dialog-sure').click(function () {
            $order_lists.remove();
            if($order_content.html().trim() == null || $order_content.html().trim().length == 0){
                $order_content.parents('.cartBox').remove();
            }
            closeM();
            $sonCheckBox = $('.son_check');
            totalMoney();
        })

        //======================================总计==========================================

        function totalMoney() {
            var total_money = 0;
            var total_count = 0;
            var calBtn = $('.calBtn a');
            $sonCheckBox.each(function () {
                if ($(this).is(':checked')) {
                    var goods = parseInt($(this).parents('.order_lists').find('.sum_price').html().substring(1));
                    var num =  parseInt($(this).parents('.order_lists').find('.sum').val());
                    total_money += goods;
                    total_count += num;
                }
            });
            $('.total_text').html('￥'+total_money);
            $('.piece_num').html(total_count);

            // console.log(total_money,total_count);

            if(total_money!=0 && total_count!=0){
                if(!calBtn.hasClass('btn_sty')){
                    calBtn.addClass('btn_sty');
                }
            }else{
                if(calBtn.hasClass('btn_sty')){
                    calBtn.removeClass('btn_sty');
                }
            }
        }
    });
</script>
</body>
</html>