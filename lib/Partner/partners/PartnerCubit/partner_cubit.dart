import 'dart:io';
import 'dart:typed_data';
import 'package:afcooadminpanel/Partner/partners/Models/PartnerModel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:afcooadminpanel/Core/api/dio_helper.dart';
import 'package:afcooadminpanel/Core/dropdownmodel.dart';
import 'package:afcooadminpanel/Core/utility.dart';
import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
part 'partner_state.dart';

class PartnerCubit extends Cubit<PartnerState> {
  PartnerCubit() : super(PartnerInitial());

  TextEditingController slugcontroller = TextEditingController();
  TextEditingController Namecontroller = TextEditingController();
  TextEditingController NmaeinEnglishcontroller = TextEditingController();
  TextEditingController Descriptioncontroller = TextEditingController();
  TextEditingController DescriptioninEnglishcontroller =
      TextEditingController();
  TextEditingController Facebookcontroller = TextEditingController();
  TextEditingController Youtubecontroller = TextEditingController();
  TextEditingController instgramcontroller = TextEditingController();
  TextEditingController Whatsapcontroller = TextEditingController();
  TextEditingController Twittercontroller = TextEditingController();
  TextEditingController Linkdencontroller = TextEditingController();
  TextEditingController SnapChatcontroller = TextEditingController();
  TextEditingController adresscontroller = TextEditingController();
  TextEditingController adressinEnglishcontroller = TextEditingController();
  TextEditingController mobilecontroller = TextEditingController();
  TextEditingController telphonecontroller = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController lat = TextEditingController();
  TextEditingController lng = TextEditingController();
  TextEditingController keywordscontroller = TextEditingController();
  TextEditingController Metadescriptioncontroller = TextEditingController();
  TextEditingController SortAt = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController nameEn = TextEditingController();
  TextEditingController discountPercent = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController priceAfterDiscount = TextEditingController();
  TextEditingController itemOrder = TextEditingController();
  List<PartnerModel> PartnersList = [];

  DDCodeListModel recordDDCodeList = DDCodeListModel(v: "", d: "");
  PartnerModel partnerModel = PartnerModel(
    id: 0,
    name: "",
    slug: "",
    cate_name: "",
    name_en: "",
    status: 0,
    branches_num: 0,
    offer_num: 0,
    services_num: 0,
    // Additional properties from PartnerbyIdModel
    keysWord: "",
    metaDescription: "",
    logo: "",
    contract: "",
    description: "",
    descriptionEn: "",
    address: "",
    addressEn: "",
    mobile: "",
    whatsapp: "",
    phone: "",
    email: "",
    cityId: 0,
    regionId: 0,
    listSetting: "",
    listSocial: "",
    lng: '',
    lat: '',
    createdDate: '',
    isFeatured: 0,
    userCreatedId: 0,
    sortAt: 0,
    cateId: 0,
    cateServiceId: 0,
    banner: "",
  );
  Map<String, dynamic> Partnerdata = {};
  bool checkedValue = false;
  String selectedOption = '';
  PartnerModel? PartnerModelObj;
  Future<List<PartnerModel>> GetallPartners(
      {int pageNumber = 1, pageSize = DeafultPageSize}) async {
    emit(GetPartnerLoading());
    await DioHelper.getData(url: "Partner/GetAll", qurey: {
      "pageNumber": pageNumber,
      "pageSize": pageSize,
    }).then((value) {
      Utility.myPrintX('GetallPartners');
      Utility.myPrintX(value.data);
      Utility.myPrintX(value.statusCode);
      List data = value.data['data'];
      Utility.myPrintX(data);
      if (value.data['statusCode'] != 200) {
        emit(GetPartnerFail());
        return [];
      } else {
        PartnersList =
            List.of(data).map((e) => PartnerModel.fromJson(e)).toList();
        Utility.myPrintX(PartnersList.length);
        emit(GetPartnerSucess());
        return PartnersList;
      }
    }).catchError((onError) {
      Utility.myPrintX('GetallPartnersEror');
      Utility.myPrintX(onError.toString());

      emit(GetPartnerFail());
      throw onError;
    });
    return PartnersList;
  }

  // Future <void> removegridRow (int index)async{
  //   emit(StateChanged());
  // }
  Future<void> GetPartnerbyid({required int id}) async {
    emit(GetPartnerByIdLoading());
    await DioHelper.getData(url: "Partner/GetById", qurey: {'id': id})
        .then((value) {
      Utility.myPrintX('GetPartnerbyid');
      Utility.myPrintX(value.data);
      Utility.myPrintX(value.statusCode);
      Partnerdata = value.data['data'];
      Utility.myPrintX(Partnerdata);
      if (value.data['statusCode'] != 200) {
        emit(GetPartnerByIdFail());
      } else {
        partnerModel = PartnerModel.fromJson(Partnerdata);

        emit(GetPartnerByIdSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX('GetPartnerbyidEror');
      Utility.myPrintX(onError.toString());

      emit(GetPartnerByIdFail());
      throw onError;
    });
  }

  void RemovePartner({required int PartnerId, required int index}) {
    emit(RemovePartnerLoading());

    DioHelper.DeleteData(url: 'Partner/DeletePartner', qurey: {'id': PartnerId})
        .then((response) {
      Map<String, dynamic> data = response.data;
      Utility.myPrintX('RemovePartner');
      Utility.myPrintX(data);
      if (data['statusCode'] != 204) {
        Utility.myPrintX('RemovePartnerFail');
        emit(RemovePartnerFail());
      } else {
        PartnersList.removeAt(index);

        emit(RemovePartnerSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX('RemovePartner error');
      Utility.myPrintX(onError.toString());
      emit(RemovePartnerFail());
      // throw onError;
    });
  }

  File? selectedLogofile;
  File? selectedContractfile;
  File? selectedBannerfile;
  Uint8List? selectedimage;
  Uint8List? selectedLogo;
  Uint8List? selectedContract;
  Uint8List? selectedBanner;
  XFile? pickedLogo;
  XFile? pickedcontract;
  XFile? pickedBannner;

  Future<void> PickImagelogo() async {
    pickedLogo = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedLogo != null) {
      selectedLogofile = File(pickedLogo!.path);
      final selectedImage = await pickedLogo!.readAsBytes();

      // Store the selected image in the appropriate variable
      if (selectedLogo == null) {
        selectedLogo = selectedImage;
      }

      emit(UploadImage());
    }
  }

  Future<void> PickContact() async {
    pickedcontract = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedcontract != null) {
      final selectedImage = await pickedcontract!.readAsBytes();

      // Store the selected image in the appropriate variable
      if (selectedContract == null) {
        selectedContractfile = File(pickedcontract!.path);
        selectedContract = selectedImage;
      }
      emit(UploadImage());
    }
  }

  Future<void> PickBanner() async {
    pickedBannner = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedBannner != null) {
      selectedBannerfile = File(pickedBannner!.path);
      final selectedImage = await pickedBannner!.readAsBytes();

      if (selectedBanner == null) {
        selectedBanner = selectedImage;
      }
      emit(UploadImage());
    }
  }

  void Addpartner(
      {required PartnerModel addPartnerModel,
      required AddPartnerimage addPartnerimage}) async {
    Utility.myPrintX(PartnerModel.postToJson(addPartnerModel));
    Utility.myPrintX(AddPartnerimage.postToJson(addPartnerimage).toString());
    emit(AddPartnerLoading());

    DioHelper.postDataFormat(
            query: PartnerModel.postToJson(addPartnerModel),
            url: "Partner/AddUpdate",
            data: AddPartnerimage.postToJson(addPartnerimage))
        .then((response) {
      Utility.myPrintX('Addpartner');
      Utility.myPrintX(response.data);
      Utility.myPrintX(response.statusCode);
      Map<String, dynamic> partnerdata = response.data;

      if (partnerdata["statusCode"] != 200) {
        Utility.myPrintX('Addpartner FAil');

        emit(AddPartnerFail());
      } else {
        emit(AddPartnerSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX('Addpartner error');
      Utility.myPrintX(onError.toString());

      emit(AddPartnerFail());
    });
  }

  String? concatenatedValues;
  Future<void> concatenateSocialMediaValues() async {
    String facebook = Facebookcontroller.text;
    String youtube = Youtubecontroller.text;
    String instagram = instgramcontroller.text;
    String whatsapp = Whatsapcontroller.text;
    String twitter = Twittercontroller.text;
    String linkedin = Linkdencontroller.text;
    String snapchat = SnapChatcontroller.text;

    concatenatedValues = [
      facebook,
      youtube,
      instagram,
      whatsapp,
      twitter,
      linkedin,
      snapchat
    ].join(',');
    print('concatenatedValues');
    print(concatenatedValues);

    emit(jion());
  }

  void Changestate() {
    emit(StateChanged());
  }

  Future<void> EditPartner(PartnerModel partnerModel) async {
    slugcontroller.text = partnerModel.slug ?? '';
    Namecontroller.text = partnerModel.name ?? '';
    NmaeinEnglishcontroller.text = partnerModel.name_en ?? '';
    Descriptioncontroller.text = partnerModel.description ?? '';
    DescriptioninEnglishcontroller.text = partnerModel.descriptionEn ?? '';
    Facebookcontroller.text = partnerModel.listSocial ?? '';
    Youtubecontroller.text = partnerModel.listSocial ?? '';
    instgramcontroller.text = partnerModel.listSocial ?? '';
    Whatsapcontroller.text = partnerModel.whatsapp ?? '';
    Twittercontroller.text = partnerModel.listSocial ?? '';
    Linkdencontroller.text = partnerModel.listSocial ?? '';
    SnapChatcontroller.text = partnerModel.listSocial ?? '';
    adresscontroller.text = partnerModel.address ?? '';
    adressinEnglishcontroller.text = partnerModel.address ?? '';
    mobilecontroller.text = partnerModel.mobile ?? '';
    telphonecontroller.text = partnerModel.mobile ?? '';
    emailController.text = partnerModel.email ?? '';
    lat.text = partnerModel.lat ?? '';
    lng.text = partnerModel.lng ?? '';
    keywordscontroller.text = partnerModel.keysWord ?? '';
    Metadescriptioncontroller.text = partnerModel.metaDescription ?? '';
    SortAt.text = partnerModel.sortAt?.toString() ?? '';
    name.text = partnerModel.Servicename ?? '';
    nameEn.text = partnerModel.ServicenameEn ?? '';
    discountPercent.text = partnerModel.discountPrice ?? '';
    price.text = partnerModel.price ?? '';
    priceAfterDiscount.text = partnerModel.discountPrice ?? '';
    itemOrder.text = partnerModel.itemorder ?? '';
    // Assuming selectedOption is a String variable
    selectedOption = partnerModel.status == 1 ? 'Posted' : 'NotPosted';
    // Assuming emit is a function to emit a state change
    emit(EditPartnerstate());
  }

  Future<void> RemoveData() async {
    slugcontroller.clear();
    Namecontroller.clear();
    NmaeinEnglishcontroller.clear();
    Descriptioncontroller.clear();
    DescriptioninEnglishcontroller.clear();
    Facebookcontroller.clear();
    Youtubecontroller.clear();
    instgramcontroller.clear();
    Whatsapcontroller.clear();
    Twittercontroller.clear();
    Linkdencontroller.clear();
    SnapChatcontroller.clear();
    adresscontroller.clear();
    adressinEnglishcontroller.clear();
    mobilecontroller.clear();
    telphonecontroller.clear();
    emailController.clear();
    lat.clear();
    lng.clear();
    keywordscontroller.clear();
    Metadescriptioncontroller.clear();
    SortAt.clear();
    // Assuming selectedOption is a String variable
    selectedOption = '';
    // Assuming emit is a function to emit a state change
    emit(RemoveDataState());
  }
}
