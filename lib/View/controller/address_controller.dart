import 'package:e_shop/base_usecase.dart';
import 'package:e_shop/constants.dart';
import 'package:e_shop/data/models/address_model.dart';
import 'package:e_shop/domain/usecase/add_address_usecase.dart';
import 'package:e_shop/domain/usecase/delete_address_usecase.dart';
import 'package:e_shop/domain/usecase/edit_address_usecase.dart';
import 'package:e_shop/domain/usecase/get_address_usecase.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  RxList<Address> addresses = <Address>[].obs;
  Rx<RequestState> addressState = RequestState.idle.obs;
  Rx<RequestState> addAddressState = RequestState.idle.obs;

  AddAddressUsecase addAddressUsecase;
  GetAddressesUsecase getAddressesUsecase;
  EditAddressUsecase editAddressUsecase;
  DeleteAddressUsecase deleteAddressUsecase;
  AddressController(this.addAddressUsecase, this.getAddressesUsecase,
      this.editAddressUsecase, this.deleteAddressUsecase);

  deleteAddress(Address address) async {
    addresses.remove(address);
    update();

    final res = await deleteAddressUsecase.call(DeleteAddressParam(address));

    res.fold((l) {
      toast(l.toString(), ToastType.error);
    }, (r) {
      toast("You have deleted ${address.name}", ToastType.success);
    });
  }

  Future<void> getAddress() async {
    addressState.value = RequestState.loading;
    update();

    final res = await getAddressesUsecase.call(const NoParameters());

    res.fold((l) {
      addressState.value = RequestState.error;
      toast(l.toString(), ToastType.error);
      update();
    }, (r) {
      addressState.value = RequestState.loaded;
      addresses.value = r;
      update();
    });
  }

  addAddress(Address address) async {
    addAddressState.value = RequestState.loading;
    update();

    final res = await addAddressUsecase.call(AddAddressUsecaseParam(address));

    res.fold((l) {
      addAddressState.value = RequestState.error;
      toast(l.toString(), ToastType.error);
      update();
    }, (r) {
      addAddressState.value = RequestState.loaded;
      addresses.add(address);
      toast("You have successfully added your address.", ToastType.success);
      Get.back();
      update();
    });
  }

  editAddress(Address address) async {
    addAddressState.value = RequestState.loading;
    update();

    final res = await editAddressUsecase.call(EditAddressParam(address));

    res.fold((l) {
      addAddressState.value = RequestState.error;
      toast(l.toString(), ToastType.error);
      update();
    }, (r) {
      addAddressState.value = RequestState.loaded;
      addresses.value = r;
      toast("You have successfully edited your address.", ToastType.success);
      Get.back();
      update();
    });
  }
}
