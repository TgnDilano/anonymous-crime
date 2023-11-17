import 'dart:convert';

class UserModel {
  UserModel({
    required this.token,
    required this.user,
  });

  final String token;
  final User user;

  factory UserModel.fromJson(String str) => UserModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        token: json["token"],
        user: User.fromMap(json["user"]),
      );

  Map<String, dynamic> toMap() => {
        "token": token,
        "user": user.toMap(),
      };

  UserModel.defaultUser()
      : token = "",
        user = User(
          blockchainIdentifier: "",
          firstName: "",
          lastName: "",
          email: "",
          profil: "",
          type: "",
          cs256Id: "",
          status: "",
          birthday: "1980-10-10",
          telephone: NTelephone(
            indicatif: "+33",
            value: "",
          ),
          address: Address(
            adr1: "-",
            adr2: "-",
            adr3: "-",
            zip: "-",
            city: "-",
            region: "-",
            country: NNationality(
              code: "+33",
              name: "France",
            ),
          ),
          billingAddress: Address(
            adr1: "-",
            adr2: "-",
            adr3: "-",
            zip: "-",
            city: "-",
            region: "-",
            country: NNationality(
              code: "+33",
              name: "France",
            ),
          ),
          nationality: NNationality(
            code: "+33",
            name: "France",
          ),
          enterpriseInfos: EnterpriseInfos(
            group: "-",
            name: "-",
            nationalIdentifier: "-",
          ),
          managedContracts: "",
          mainTokenSymbol: "",
          itemOwnerBlockchainId: "",
          kycDocs: {},
          paymentProfil: PaymentProfil(
            paymentUserIdentifier: "",
            bankAccountIdentifier: "",
            mandateIdentifier: "",
            mandateUrl: "",
            mandateLastDate: DateTime.now(),
            wallets: [Wallet(walletId: "", type: "")],
          ),
          referenceContract: "",
          bank: Bank(
            localInstance: "",
            creation: false,
            empty: true,
            iban: "",
          ),
          bankMode: false,
        );
}

class User {
  User({
    required this.blockchainIdentifier,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.cs256Id,
    required this.profil,
    required this.type,
    required this.status,
    required this.birthday,
    required this.telephone,
    required this.address,
    required this.nationality,
    required this.enterpriseInfos,
    required this.managedContracts,
    required this.mainTokenSymbol,
    required this.itemOwnerBlockchainId,
    required this.kycDocs,
    required this.paymentProfil,
    this.referenceContract,
    required this.billingAddress,
    required this.bank,
    this.bankMode,
  });

  final String blockchainIdentifier;
  final String firstName;
  final String lastName;
  final String email;
  final String profil;
  final String type;
  final String cs256Id;
  final String status;
  final String birthday;
  final NTelephone telephone;
  final Address address;
  final Address billingAddress;
  final NNationality nationality;
  final EnterpriseInfos enterpriseInfos;
  final dynamic managedContracts;
  final String mainTokenSymbol;
  final String itemOwnerBlockchainId;
  final dynamic kycDocs;
  final PaymentProfil paymentProfil;
  final dynamic referenceContract;
  final Bank bank;
  final bool? bankMode;

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        blockchainIdentifier: json["blockchainIdentifier"] ?? '',
        firstName: json["firstName"] ?? "",
        lastName: json["lastName"] ?? '',
        email: json["email"] ?? '',
        kycDocs: json['kycDocs'] ?? {},
        profil: json["profil"] ?? '',
        type: json["type"] ?? '',
        cs256Id: json["cs256Id"] ?? '',
        status: json["status"] ?? '',
        referenceContract: json['referenceContract'] ?? '',
        birthday: json["birthday"] != null
            ? json["birthday"].toString().replaceAll('/', '-')
            : "1980-10-10",
        telephone: json['telephone'] != null
            ? NTelephone.fromMap(json["telephone"])
            : NTelephone.init,
        address: json["address"] != null
            ? Address.fromMap(json["address"])
            : Address.init,
        nationality: json["nationality"] != null
            ? NNationality.fromMap(json["nationality"])
            : NNationality.init,
        enterpriseInfos: json["enterpriseInfos"] != null
            ? EnterpriseInfos.fromMap(json["enterpriseInfos"])
            : EnterpriseInfos.init,
        managedContracts: json["managedContracts"] ?? '',
        mainTokenSymbol: json["mainTokenSymbol"] ?? '',
        itemOwnerBlockchainId: json["itemOwnerBlockchainID"] ?? '',
        paymentProfil: json['paymentProfil'] == null
            ? PaymentProfil.init
            : PaymentProfil.fromMap(json['paymentProfil']),
        billingAddress: json['billingAddress'] == null
            ? Address.init
            : Address.fromMap(json['billingAddress']),
        bank: json["bank"] == null ? Bank() : Bank.fromMap(json["bank"]),
        bankMode: json["bankMode"],
      );

  Map<String, dynamic> toMap() => {
        "blockchainIdentifier": blockchainIdentifier,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "profil": profil,
        "type": type,
        "cs256Id": cs256Id,
        "status": status,
        "birthday": birthday,
        "telephone": telephone.toMap(),
        "address": address.toMap(),
        "nationality": nationality.toMap(),
        "enterpriseInfos": enterpriseInfos.toMap(),
        "managedContracts": managedContracts,
        "mainTokenSymbol": mainTokenSymbol,
        "itemOwnerBlockchainID": itemOwnerBlockchainId,
        "kycDocs": kycDocs,
        'referenceContract': referenceContract,
        "billingAddress": billingAddress.toMap(),
        "bank": bank.toMap(),
        "bankMode": bankMode,
      };

  static User get init => User(
        blockchainIdentifier: "",
        firstName: "",
        lastName: "",
        email: "",
        profil: "",
        type: "",
        cs256Id: "",
        status: "",
        birthday: "1980-10-10",
        telephone: NTelephone(
          indicatif: "+33",
          value: "",
        ),
        address: Address(
          adr1: "-",
          adr2: "-",
          adr3: "-",
          zip: "-",
          city: "-",
          region: "-",
          country: NNationality(
            code: "+33",
            name: "France",
          ),
        ),
        billingAddress: Address(
          adr1: "-",
          adr2: "-",
          adr3: "-",
          zip: "-",
          city: "-",
          region: "-",
          country: NNationality(
            code: "+33",
            name: "France",
          ),
        ),
        nationality: NNationality(
          code: "+33",
          name: "France",
        ),
        enterpriseInfos: EnterpriseInfos(
          group: "-",
          name: "-",
          nationalIdentifier: "-",
        ),
        managedContracts: "",
        mainTokenSymbol: "",
        itemOwnerBlockchainId: "",
        kycDocs: {},
        paymentProfil: PaymentProfil(
          paymentUserIdentifier: "",
          bankAccountIdentifier: "",
          mandateIdentifier: "",
          mandateUrl: "",
          mandateLastDate: DateTime.now(),
          wallets: [Wallet(walletId: "", type: "")],
        ),
        referenceContract: "",
        bank: Bank(
          localInstance: "",
          creation: false,
          empty: true,
          iban: "",
        ),
        bankMode: false,
      );
}

class Address {
  Address({
    required this.adr1,
    required this.adr2,
    required this.adr3,
    required this.zip,
    required this.city,
    required this.region,
    required this.country,
  });

  final String adr1;
  final String adr2;
  final String adr3;
  final String zip;
  final String city;
  final String region;
  final NNationality country;

  factory Address.fromJson(String str) => Address.fromMap(
        json.decode(str),
      );

  String toJson() => json.encode(
        toMap(),
      );

  static Address init = Address(
    adr1: "-",
    adr2: "-",
    adr3: "-",
    zip: "-",
    city: "-",
    region: "-",
    country: NNationality(code: "+33", name: "France"),
  );

  factory Address.fromMap(Map<String, dynamic> json) => Address(
        adr1: json["adr1"] ?? "-",
        adr2: json["adr2"] ?? "-",
        adr3: json["adr3"] ?? "-",
        zip: json["zip"] ?? "-",
        city: json["city"] ?? "-",
        region: json["region"] ?? "-",
        country: json['country'] != null
            ? NNationality.fromMap(json["country"])
            : NNationality.init,
      );

  Map<String, dynamic> toMap() => {
        "adr1": adr1,
        "adr2": adr2,
        "adr3": adr3,
        "zip": zip,
        "city": city,
        "region": region,
        "country": country.toMap(),
      };
}

class NNationality {
  NNationality({
    required this.code,
    required this.name,
  });

  final String code;
  final String name;

  factory NNationality.fromJson(String str) => NNationality.fromMap(
        json.decode(str),
      );

  static NNationality init = NNationality(code: "+33", name: "France");

  String toJson() => json.encode(
        toMap(),
      );

  factory NNationality.fromMap(Map<String, dynamic> json) => NNationality(
        code: json["code"] ?? "",
        name: json["name"] ?? "",
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "name": name,
      };
}

class EnterpriseInfos {
  EnterpriseInfos({
    required this.group,
    required this.name,
    required this.nationalIdentifier,
  });

  final String group;
  final String name;
  final String nationalIdentifier;

  factory EnterpriseInfos.fromJson(String str) => EnterpriseInfos.fromMap(
        json.decode(str),
      );

  String toJson() => json.encode(
        toMap(),
      );

  factory EnterpriseInfos.fromMap(Map<String, dynamic> json) => EnterpriseInfos(
        group: json["group"] ?? '',
        name: json["name"] ?? '',
        nationalIdentifier: json["nationalIdentifier"] ?? "",
      );

  static EnterpriseInfos init = EnterpriseInfos(
    group: "-",
    name: "-",
    nationalIdentifier: "-",
  );

  Map<String, dynamic> toMap() => {
        "group": group,
        "name": name,
        "nationalIdentifier": nationalIdentifier,
      };
}

class NTelephone {
  NTelephone({
    required this.indicatif,
    required this.value,
  });

  final String indicatif;
  final String value;

  factory NTelephone.fromJson(String str) => NTelephone.fromMap(
        json.decode(str),
      );

  static NTelephone init = NTelephone(indicatif: "+33", value: "-");

  String toJson() => json.encode(
        toMap(),
      );

  factory NTelephone.fromMap(Map<String, dynamic> json) => NTelephone(
        indicatif: json["indicatif"] ?? '',
        value: json["value"] ?? '',
      );

  Map<String, dynamic> toMap() => {
        "indicatif": indicatif,
        "value": value,
      };
}

class PaymentProfil {
  PaymentProfil({
    required this.paymentUserIdentifier,
    required this.bankAccountIdentifier,
    required this.mandateIdentifier,
    required this.mandateUrl,
    required this.mandateLastDate,
    required this.wallets,
  });

  final String paymentUserIdentifier;
  final String bankAccountIdentifier;
  final String mandateIdentifier;
  final String mandateUrl;
  final DateTime mandateLastDate;
  final List<Wallet> wallets;

  factory PaymentProfil.fromJson(String str) => PaymentProfil.fromMap(
        json.decode(str),
      );

  String toJson() => json.encode(
        toMap(),
      );

  factory PaymentProfil.fromMap(Map<String, dynamic> json) => PaymentProfil(
        paymentUserIdentifier: json["paymentUserIdentifier"] ?? "",
        bankAccountIdentifier: json["bankAccountIdentifier"] ?? "",
        mandateIdentifier: json["mandateIdentifier"] ?? "",
        mandateUrl: json["mandateUrl"] ?? "",
        mandateLastDate: DateTime.parse(
          json["mandateLastDate"] ?? "1998-10-01T03:17:00.000000Z",
        ),
        wallets: json["wallets"] != null
            ? List<Wallet>.from(
                json["wallets"].map(
                  (x) => Wallet.fromMap(x),
                ),
              )
            : [],
      );

  Map<String, dynamic> toMap() => {
        "paymentUserIdentifier": paymentUserIdentifier,
        "bankAccountIdentifier": bankAccountIdentifier,
        "mandateIdentifier": mandateIdentifier,
        "mandateUrl": mandateUrl,
        "mandateLastDate": mandateLastDate.toIso8601String(),
        "wallets": List<dynamic>.from(wallets.map(
          (x) => x.toMap(),
        )),
      };

  static PaymentProfil init = PaymentProfil(
    paymentUserIdentifier: "",
    bankAccountIdentifier: '',
    mandateIdentifier: '',
    mandateUrl: '',
    mandateLastDate: DateTime.now(),
    wallets: [Wallet(walletId: "", type: '')],
  );
}

class Wallet {
  Wallet({
    required this.walletId,
    required this.type,
  });

  final String walletId;
  final String type;

  factory Wallet.fromJson(String str) => Wallet.fromMap(
        json.decode(str),
      );

  String toJson() => json.encode(
        toMap(),
      );

  factory Wallet.fromMap(Map<String, dynamic> json) => Wallet(
        walletId: json["walletId"] ?? "",
        type: json["type"] ?? "",
      );

  Map<String, dynamic> toMap() => {
        "walletId": walletId,
        "type": type,
      };
}

class Bank {
  final String localInstance;
  final bool creation;
  final bool empty;
  final String iban;

  Bank({
    this.localInstance = "",
    this.creation = false,
    this.empty = true,
    this.iban = '',
  });

  Bank copyWith({
    String? localInstance,
    bool? creation,
    bool? empty,
    String? iban,
  }) =>
      Bank(
        localInstance: localInstance ?? this.localInstance,
        creation: creation ?? this.creation,
        empty: empty ?? this.empty,
        iban: iban ?? this.iban,
      );

  factory Bank.fromJson(String str) => Bank.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Bank.fromMap(Map<String, dynamic> json) => Bank(
        localInstance: json["localInstance"] ?? "",
        creation: json["creation"] ?? false,
        empty: json["empty"] ?? true,
        iban: json["iban"] ?? "",
      );

  Map<String, dynamic> toMap() => {
        "localInstance": localInstance,
        "creation": creation,
        "empty": empty,
        "iban": iban,
      };
}
