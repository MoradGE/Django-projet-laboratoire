from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from .models import Equipment


@login_required
def equipements_dashboard(request):
    total = Equipment.objects.count()
    disponibles = Equipment.objects.filter(availability='disponible').count()
    reserves = Equipment.objects.filter(availability='reserve').count()
    utilise = Equipment.objects.filter(availability='utilise').count()

    panne = Equipment.objects.filter(status='panne').count()
    maintenance = Equipment.objects.filter(status='maintenance').count()

    return render(request, 'lab_app/dashboard.html', {
        'total': total,
        'disponibles': disponibles,
        'reserves': reserves,
        'utilise': utilise,
        'panne': panne,
        'maintenance': maintenance,
    })


@login_required
def equipment_list(request):
    query = request.GET.get('q')

    if query:
        equipments = Equipment.objects.filter(name__icontains=query)
    else:
        equipments = Equipment.objects.all()

    return render(request, 'lab_app/equipment_list.html', {
        'equipments': equipments,
        'query': query
    })


@login_required
def add_equipment(request):
    if request.method == "POST":
        Equipment.objects.create(
            name=request.POST.get("name"),
            serial_number=request.POST.get("serial_number"),
            status=request.POST.get("status"),
            availability=request.POST.get("availability")
        )
        return redirect('equipment_list')

    return render(request, 'lab_app/add_equipment.html')


@login_required
def update_equipment(request, id):
    equipment = get_object_or_404(Equipment, id=id)

    if request.method == "POST":
        equipment.name = request.POST.get("name")
        equipment.serial_number = request.POST.get("serial_number")
        equipment.status = request.POST.get("status")
        equipment.availability = request.POST.get("availability")
        equipment.save()
        return redirect('equipment_list')

    return render(request, 'lab_app/update_equipment.html', {'equipment': equipment})


@login_required
def delete_equipment(request, id):
    equipment = get_object_or_404(Equipment, id=id)
    equipment.delete()
    return redirect('equipment_list')