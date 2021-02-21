import 'package:firebase_database/firebase_database.dart';
class User {

  String _uid,_name,_lic_num,_type,_gate_name,_dist;
  DateTime _lice_data ;

User (this._dist,this._gate_name,this._lic_num,
    this._lice_data,this._name,
  this._type
    );
User.map(dynamic obj){

  this._dist=obj['distination'];
  this._gate_name=obj['gateName'];
  this._lic_num=obj['license_No'];
  this._lice_data=obj['LicenseData'];
  this._name=obj['Car_Owner'];
  this._type=obj['Category'];
}

String get id =>_uid;
  String get distination =>_dist;
  String get gateName =>_gate_name;
  String get license_No =>_lic_num;
  DateTime get LicenseData =>_lice_data;
  String get Car_Owner =>_name;
  String get Category =>_type;

  User.fromSnapShot (DataSnapshot sp)
  {
    _dist=sp.value['distination'];
    _gate_name=sp.value['gateName'];
    _lic_num=sp.value['license_No'];
    _lice_data=sp.value['LicenseData'];
    _name=sp.value['Car_Owner'];
    _type=sp.value['Category'];
  }



}