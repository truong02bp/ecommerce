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

    def count(self):
        return Laptop.objects.count()

    def find_by_producer_and_name(self, producer, name, page, limit, sort):
        offset = (page-1) * limit
        if producer is None:
            producer = ''
        if name is None:
            name = ''
        if sort == 'asc':
            return Laptop.objects.filter(item__name__contains=str(name)).filter(
                producer__name__contains=str(producer)).order_by('item__price')[offset:offset + limit]
        if sort == 'desc':
            return Laptop.objects.filter(item__name__contains=str(name)).filter(
                producer__name__contains=str(producer)).order_by('-item__price')[offset:offset + limit]
        return Laptop.objects.filter(item__name__contains=str(name)).filter(
            producer__name__contains=str(producer))[offset:offset + limit]
