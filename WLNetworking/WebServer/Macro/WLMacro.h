#import <AFNetworking.h>

// 项目打包上线都不会打印日志，因此可放心。
#ifdef DEBUG
#define WLHttpAppLog(FORMAT, ...) \
fprintf(stderr,"%s\n",\
[[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]\
);
#else
#define WLHttpAppLog(FORMAT,...)
#endif

NS_ASSUME_NONNULL_BEGIN
typedef enum : NSUInteger {
    get_wl,
    post_wl,
    put_wl,
} requestType_wl;

@class WLHttpResponseModel;
typedef void(^progress_wl)(WLHttpResponseModel * __nullable model);
typedef void(^success_wl)(WLHttpResponseModel * __nullable model);
typedef void(^failure_wl)(WLHttpResponseModel * __nullable model);

NS_ASSUME_NONNULL_END


