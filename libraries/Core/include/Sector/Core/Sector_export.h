#ifndef SECTOR_EXPORT_H
#define SECTOR_EXPORT_H
#if COMPILER_ID == 1

#if defined(MAKE_SECTOR) 

#ifdef __APPLE__
#  define SECTOR_API __attribute__((visibility("default")))
#else
#  define SECTOR_API __declspec(dllexport)
#  define SECTOR_FUNC_API extern "C" __declspec(dllexport)
#endif // __APPLE__
#else

#ifdef __APPLE__
#  define SECTOR_API __attribute__((visibility("default")))
#else
#  define SECTOR_API __declspec(dllimport)
#endif // __APPLE__

#endif// MAKE_SECTOR
#else

#  define SECTOR_API 
#  define SECTOR_API

#endif // COMPILER_ID
#endif // SECTOR_EXPORT_H