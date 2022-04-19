
// chuyển sang số
function toNumber(priceString)
{
    let price = 0;
    for (let i=0;i<priceString.length;i++)
        if(priceString[i]>='0' && priceString[i]<='9')
            price = price*10 + (priceString[i]-'0');
    return price;
}
// chuyển sang chuỗi
function toString(totalPrice)
{
    let rs = "₫";
    let total = totalPrice.toString();
    let cnt=0;
    for (let i=total.length-1;i>=0;i--)
    {
        rs+=total[i];
        cnt++;
        if (cnt==3 && i!=0)
        {
            rs+=",";
            cnt=0;
        }
    }
    rs = rs.split("").reverse().join("");
    return rs;
}
// tính tổng tiền
function totalPrice()
{
    let totalPrice=0;
    $('.cart-price').each(function () {
        let priceString = $(this).text();
        totalPrice+=toNumber(priceString);
    })
    let vat = totalPrice/10;
    let lastTotalPrice = totalPrice + vat;
    $('.form-tax').find("div.totalPrice").html(toString(totalPrice));
    $('.form-tax').find("div.vat-price").html(toString(vat));
    $('.form-tax').find("div.last-price").html(toString(lastTotalPrice));
}
// xóa sản phẩm trong giỏ hàng
$('.delete-cart').click(function () {
    let id = $(this).attr("data-id");
    let a = $(this).closest("div.row-cart");
    $.ajax(
        {
            url: '/api-cart/delete',
            type: 'DELETE',
            data:
                {
                    id:id
                },
            success: function (value)
            {
                alert("Xóa thành công");
                a.remove();
                $('#cart-parent').find("div").html("<span>" + value + "</span>");
                if (value == 0)
                    $('#cart-parent').find("div").remove();
                totalPrice();
            }
        }
    )
})
// thêm sản phẩm vào giỏ hàng
$('.cart-button').click(function ()
{
    let id = $(this).attr("data-id");
    $.ajax(
        {
            url: "/api-cart/add",
            type: "POST",
            data:
                {
                    id:id
                },
            success: function (value) {
                // alert("Thêm vào giỏ hàng thành công");
                $('#cart-parent').find("div").html("<span>" + value + "</span>");
                $('#cart-parent').find("div").addClass("cart-alert");
            },
            error: function () {
                alert("toang");
            }
        }
    )
})
// cập nhật số lượng của sản phẩm
totalPrice();
$('.quantity-item').change(function () {
    let quantity = $(this).val();
    let id = $(this).closest("div.row-cart").attr("data-value");
    let price = $(this).closest("div.row-cart").find("div.cart-price");
    $.ajax(
        {
            url: 'api-cart/update-quantity',
            type: 'PUT',
            data:
                {
                    id:id,
                    quantity:quantity
                },
            success:function (value)
            {
                price.html(value);
                totalPrice();
            }
        }
    )
})
$('#search-button').click(function () {
    let itemName = $('#search').val();
    alert(itemName);
    $.ajax({
        url: "/api-item/search",
        type: 'GET',
        data:
            {
                itemName:itemName
            },
        success: function (value)
        {
            if (value > 0)
                window.location.href = "/page-tim-kiem?itemName="+itemName+"&page=1&limit=9";
            else
                alert("Không tìm thấy sản phẩm nào");
        }
    })
})
$('.dat-hang').click(function ()
{
    let data = {};
    let formData = $('#formSubmit').serializeArray();
    let price = toNumber($('.form-tax').find("div.last-price").text());
    data["price"] = price;
    $.each(formData,function (i,v) {
        data[""+v.name+""] = v.value;
    })
    $.ajax({
        url: "/api-cart/add-bill",
        type: "POST",
        data: JSON.stringify(data),
        contentType: "application/json",
        success: function () {
            alert("Đặt hàng thành công");
        },
        error: function () {
            alert("Đặt hàng thất bại");
        }
    })
})
$('.price-radio').click(function ()
{
    let priceSelect = $(this).val();
    let url = window.location.href;
    if (url.includes("price")==false)
        window.location.href = url+"&price="+priceSelect;
    else
    {
        url = url.substring(0,url.length-3);
        window.location.href = url+priceSelect;
    }
})
