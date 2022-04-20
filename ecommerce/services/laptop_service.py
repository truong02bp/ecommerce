from ecommerce.models import Laptop


class LaptopService:
    __instance = None

    def __init__(self):
        LaptopService.__instance = self

    @staticmethod
    def get_instance():
        if LaptopService.__instance is None:
            LaptopService()
        return LaptopService.__instance

    def find_all(self):
        return Laptop.objects.all()

    def find_by_id(self, id):
        return Laptop.objects.get(id=id)

    def find_limit(self, counter):
        return Laptop.objects.all().order_by('id')[:counter]
