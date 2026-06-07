# Keep JavaScript interface methods
-keepclassmembers class * {
    @android.webkit.JavascriptInterface <methods>;
}

# Aggressive optimization
-optimizationpasses 5
-overloadaggressively
-repackageclasses ''
-allowaccessmodification

# Remove debug/verbose/info logging in release builds for speed
# Keep error and warning logs for production debugging
-assumenosideeffects class android.util.Log {
    public static *** d(...);
    public static *** v(...);
    public static *** i(...);
}

# Remove unused code more aggressively
-dontwarn javax.annotation.**
-dontwarn org.jetbrains.annotations.**
