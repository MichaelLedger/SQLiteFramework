//#ifdef __OBJC__
//#import <UIKit/UIKit.h>
//#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
//#endif

// Swift inner contains 'sqlite3.h', so we cannot import same name files
//#include <latest_sqlite3.h>
//#include <sqlite3ext.h>
#include <sqlite3.h>

FOUNDATION_EXPORT double SQLiteAmalgamationVersionNumber;
FOUNDATION_EXPORT const unsigned char SQLiteAmalgamationVersionString[];
