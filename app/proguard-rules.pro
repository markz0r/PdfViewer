# Keep JavaScript interface methods
-keepclassmembers class * {
    @android.webkit.JavascriptInterface <methods>;
}

# Aggressive optimization
-optimizationpasses 5
-overloadaggressively
-repackageclasses ''
-allowaccessmodification

# Remove logging in release builds for speed and security
-assumenosideeffects class android.util.Log {
    public static *** d(...);
    public static *** v(...);
    public static *** i(...);
    public static *** w(...);
    public static *** e(...);
}

# Remove unused code more aggressively
-dontwarn javax.annotation.**
-dontwarn org.jetbrains.annotations.**
