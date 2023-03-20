package dev.nivera.mindfuldiary

import kotlin.random.Random
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
  override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
    super.configureFlutterEngine(flutterEngine)
    MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "example.com/channel").setMethodCallHandler {
      call, result ->
        when (call.method) {
          "getRandomNumber" -> result.success(getRandomNumber())
          else -> result.notImplemented()
        }
    }
  }

  fun getRandomNumber(): Int {
    val num = Random.nextInt(100)
    return num
  }
}