package com.example.ldh.testijkplayer;

import android.content.Context;
import android.graphics.SurfaceTexture;
import android.net.Uri;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.Surface;
import android.view.TextureView;

import java.io.IOException;

import tv.danmaku.ijk.media.player.IjkMediaPlayer;

public class MainActivity extends AppCompatActivity implements TextureView.SurfaceTextureListener {

    IjkMediaPlayer mPlayer;
    TextureView mView;
    private Context mAppContext;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        mAppContext = this;

        IjkMediaPlayer.loadLibrariesOnce(null);
        IjkMediaPlayer.native_profileBegin("libijkplayer.so");
        testijk();
    }

    void testijk() {
        mView = (TextureView) findViewById(R.id.view2);
        mView.setSurfaceTextureListener(this);

        mPlayer = new IjkMediaPlayer();
        mPlayer.native_setLogLevel(IjkMediaPlayer.IJK_LOG_ERROR);
        //开启硬解码        ijkMediaPlayer.setOption(IjkMediaPlayer.OPT_CATEGORY_PLAYER, "mediacodec", 1);

        mPlayer.setOption(IjkMediaPlayer.OPT_CATEGORY_PLAYER, "overlay-format", IjkMediaPlayer.SDL_FCC_I420);

        try {
            Uri uri = Uri.parse("http://devimages.apple.com.edgekey.net/streaming/examples/bipbop_4x3/bipbop_4x3_variant.m3u8");
            mPlayer.setDataSource("http://devimages.apple.com.edgekey.net/streaming/examples/bipbop_4x3/gear1/prog_index.m3u8");
//            mPlayer.setDataSource("https://oss-api-30day.oss-cn-hangzhou.aliyuncs.com/30day-gy5tb3w4c4syrj3mbh2isx79uyq9nkpj/1522598400-1522684799-f8m7.m3u8");
        } catch (IOException e) {
            e.printStackTrace();
        }
        mPlayer.prepareAsync();
        //long nativeHandler = getNativeHandler();
        //mPlayer.setExternalRenderer(nativeHandler);
        mPlayer.start();
    }

    @Override
    public void onSurfaceTextureAvailable(SurfaceTexture surfaceTexture, int i, int i1) {
        mPlayer.setSurface(new Surface (mView.getSurfaceTexture()));
    }

    @Override
    public void onSurfaceTextureSizeChanged(SurfaceTexture surfaceTexture, int i, int i1) {

    }

    @Override
    public boolean onSurfaceTextureDestroyed(SurfaceTexture surfaceTexture) {
        return false;
    }

    @Override
    public void onSurfaceTextureUpdated(SurfaceTexture surfaceTexture) {

    }

    static {
        System.loadLibrary("testijk");
    }
}
