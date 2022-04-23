from ecommerce.models import Cart, CartItem
from django.db.models import F


class CartService:
    __instance = None

    def __init__(self):
        CartService.__instance = self

    @staticmethod
    def getInstance():
        if CartService.__instance is None:
            CartService()
        return CartService.__instance

    def find_by_user_id(self, user_id):
        return Cart.objects.filter(user_id=user_id).get()

    def add_to_cart(self, user_id, item_id):
        cart = Cart.objects.filter(user_id=user_id).get()
        if not cart:
            cart = Cart()
            cart.user_id = user_id
            cart.total_money = 0
            cart.save()

        row_update = CartItem.objects.filter(cart_id=cart.id, item_id=item_id).update(quantity=F('quantity') + 1)
        if row_update == 0:
            cart_item = CartItem()
            cart_item.cart_id = cart.id
            cart_item.item_id = item_id
            cart_item.quantity = 1
            cart_item.save()
        return cart.cartitem_set.count()

    def remove_from_cart(self, user_id, item_id):
        cart = Cart.objects.filter(user_id=user_id).get()
        print(cart.id)
        print(item_id)
        CartItem.objects.filter(cart_id=cart.id, item_id=item_id).delete()
        return cart.cartitem_set.count()

    def update_quantity(self, cart_item_id, quantity):
        cart_item = CartItem.objects.get(pk=cart_item_id)
        cart_item.quantity = quantity
        cart_item.save()
        return int(quantity) * cart_item.item.price

    def count_item(self, user_id):
        cart = Cart.objects.filter(user_id=user_id).get()
        return cart.cartitem_set.count()
