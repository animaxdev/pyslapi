# -*- coding: utf-8 -*-
from libcpp cimport bool
from .defs cimport *
from .unicodestring cimport *

ctypedef unsigned char SUByte

cdef extern from "slapi/color.h":
    ctypedef struct SUColor:
        SUByte red,
        SUByte green,
        SUByte blue,
        SUByte alpha

cdef extern from "slapi/model/material.h":
    cdef enum SUMaterialType:
        SUMaterialType_Colored = 0, # Colored material
        SUMaterialType_Textured,    # Textured material
        SUMaterialType_ColorizedTexture #Colored and textured material

    SUEntityRef SUMaterialToEntity(SUMaterialRef material)
    SUMaterialRef SUMaterialFromEntity(SUEntityRef entity)
    SU_RESULT SUMaterialCreate(SUMaterialRef* material)
    SU_RESULT SUMaterialRelease(SUMaterialRef* material)
    SU_RESULT SUMaterialSetName(SUMaterialRef material, const char* name)
    SU_RESULT SUMaterialGetName(SUMaterialRef material, SUStringRef* name)
    SU_RESULT SUMaterialSetColor(SUMaterialRef material, const SUColor* color)
    SU_RESULT SUMaterialGetColor(SUMaterialRef material, SUColor* color)
    SU_RESULT SUMaterialSetTexture(SUMaterialRef material, SUTextureRef texture)
    SU_RESULT SUMaterialGetTexture(SUMaterialRef material,  SUTextureRef* texture)
    SU_RESULT SUMaterialGetOpacity(SUMaterialRef material, double* alpha)
    SU_RESULT SUMaterialSetOpacity(SUMaterialRef material, double alpha)
    SU_RESULT SUMaterialGetUseOpacity(SUMaterialRef material, bool* use_opacity)
    SU_RESULT SUMaterialSetUseOpacity(SUMaterialRef material, bool use_opacity)
    SU_RESULT SUMaterialSetType(SUMaterialRef material, SUMaterialType type)
    SU_RESULT SUMaterialGetType(SUMaterialRef material, SUMaterialType* type)