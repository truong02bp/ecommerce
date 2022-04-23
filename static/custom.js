// chuyển sang số

function toNumber(priceString) {
    let price = 0;
    let end;
    for (let i = 0; i < priceString.length; i++) {
        if (priceString[i] >= '0' && priceString[i] <= '9') {
            price = price * 10 + (priceString[i] - '0');
            end = i;
        }
    }
    if (priceString[end] === '0' && priceString[end - 1] === '.')
        price /= 10;
    return price;
}

// chuyển sang chuỗi
function toString(totalPrice) {
    let rs = "₫";
    let total = totalPrice.toString();
    let cnt = 0;
    for (let i = total.length - 1; i >= 0; i--) {
        rs += total[i];
        cnt++;
        if (cnt === 3 && i !== 0) {
            rs += ",";
            cnt = 0;
        }
    }
    rs = rs.split("").reverse().join("");
    return rs;
}


function formatPrice() {
    $('.price-format').each(function () {
        let priceString = $(this).text();
        value = toNumber(priceString);
        $(this).text(toString(value))
    })
}

formatPrice()

$('.dat-hang').click(function () {
    let data = {};
    let formData = $('#formSubmit').serializeArray();
    let price = toNumber($('.form-tax').find("div.last-price").text());
    data["price"] = price;
    $.each(formData, function (i, v) {
        data["" + v.name + ""] = v.value;
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
$('.price-radio').click(function () {
    let priceSelect = $(this).val();
    let url = window.location.href;
    if (url.includes("price") === false)
        window.location.href = url + "&price=" + priceSelect;
    else {
        url = url.substring(0, url.length - 3);
        window.location.href = url + priceSelect;
    }
})
