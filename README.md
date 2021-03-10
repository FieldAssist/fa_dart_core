# fa_dart_core [![codecov](https://codecov.io/gh/FieldAssist/fa_dart_core/branch/main/graph/badge.svg?token=0SJUKQDEC2)](https://codecov.io/gh/FieldAssist/fa_dart_core)

Official FA Flutter core package.

## Getting Started

Add following code in pubspec.yaml file in dependencies:

```
  fa_dart_core:
    git:
      url: https://github.com/FieldAssist/fa_dart_core.git
      ref: main
```

## Logger

To use add following line as top level variable anywhere in your project

```
final AppLog logger = AppLogImpl();
```

### Debug

```
logger.d("debug value: $token");
```

### Exception

```
logger.e(e,stacktrace); // Use StackTrace.current in case no stacktrace available
```

### Info

```
logger.i("Api response: xyz");
```