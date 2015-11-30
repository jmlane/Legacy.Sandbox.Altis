_obj = _this select 0;
_normal = surfaceNormal (position _obj);
_obj setVectorUp _normal;