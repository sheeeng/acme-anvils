#define STRINGIZE2(s) #s
#define STRINGIZE(s) STRINGIZE2(s)

#define VER_FILENAME_STR            "AcmeAnvils"
#define VER_PRODUCTNAME_STR         "Acme Anvils"
#define VER_COMPANYNAME_STR         "Contoso Corporation"

#define VERSION_MAJOR               0
#define VERSION_MINOR               0
#define VERSION_BUILD               0
#define VERSION_PRIVATE             0
#define VERSION_SHA1                "c0ffee"

#if (_MSC_VER == 1800)              // Visual C++ 2013 (vc12)
#define VER_COMMENTS_STR            "Build with Visual Studio 2013."
#define VER_FILE_DESCRIPTION_STR    VER_PRODUCTNAME_STR " built with msvc12."
#elif (_MSC_VER == 1700)            // Visual C++ 2012 (vc11)
#define VER_COMMENTS_STR            "Build with Visual Studio 2012."
#define VER_FILE_DESCRIPTION_STR    VER_PRODUCTNAME_STR " built with msvc11."
#endif

#define VER_LEGALTRADEMARKS_STR     "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer lobortis, elit quis vulputate maximus, sapien lorem mollis lorem, vel rutrum lacus augue at erat." "\r\n" \
                                    "Quisque a placerat nibh. Donec gravida dui eros, id faucibus orci rutrum in. Sed ac diam id turpis facilisis suscipit sit amet non elit. Pellentesque a feugiat purus, vitae laoreet massa. Nam nec dolor in quam accumsan sagittis. Suspendisse eget elementum erat, eu laoreet dui. Vivamus nisl orci, dictum quis condimentum nec, accumsan a libero."

#define VER_FILE_VERSION            VERSION_MAJOR, VERSION_MINOR, VERSION_BUILD, VERSION_PRIVATE
#define VER_FILE_VERSION_STR        STRINGIZE(VERSION_MAJOR) \
                                    "." STRINGIZE(VERSION_MINOR) \
                                    "." STRINGIZE(VERSION_BUILD) \
                                    "." STRINGIZE(VERSION_PRIVATE) \
                                    "." VERSION_SHA1 "\0"

#define VER_PRODUCT_VERSION         VER_FILE_VERSION
#define VER_PRODUCT_VERSION_STR     VER_FILE_VERSION_STR
#define VER_ORIGINAL_FILENAME_STR   VER_FILENAME_STR ".dll"
#define VER_INTERNAL_NAME_STR       VER_ORIGINAL_FILENAME_STR
#define VER_COPYRIGHT_STR           "Copyright © 2015 Contoso Corporation and/or its subsidiary(-ies)."

#ifdef _DEBUG
#define VER_VER_DEBUG               VS_FF_DEBUG
#else
#define VER_VER_DEBUG               0
#endif

#define VER_FILEOS                  VOS_NT_WINDOWS32
#define VER_FILEFLAGS               VER_VER_DEBUG
#define VER_FILETYPE                VFT_APP
