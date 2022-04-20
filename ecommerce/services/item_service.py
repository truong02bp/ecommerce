
class ItemService:
    __instance = None

    def __init__(self):
        ItemService.__instance = self

    @staticmethod
    def getInstance():
        if ItemService.__instance is None:
            ItemService()
        return ItemService.__instance
