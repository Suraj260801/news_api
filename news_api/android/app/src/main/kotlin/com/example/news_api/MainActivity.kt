package com.example.news_api

import android.content.Intent
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {

    private val _channel ="samples.flutter.dev/method_channel"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        val channel= MethodChannel(flutterEngine.dartExecutor.binaryMessenger, _channel)
        channel.setMethodCallHandler { call, result ->
            when (call.method) {
                "share" -> {
                    shareText(call.arguments.toString());
                }
                else -> {
                    result.notImplemented()
                }
            }
        }
    }


    private fun shareText(text: String?) {
        val sharingIntent = Intent(Intent.ACTION_SEND)
        sharingIntent.type = "text/plain"
        sharingIntent.putExtra(Intent.EXTRA_TEXT, text)
        startActivity(Intent.createChooser(sharingIntent, "Share using"))
    }
}

