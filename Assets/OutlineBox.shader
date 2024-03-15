Shader "Unlit/OutlineBoxShader"
{
    Properties
    {
        _Width ("Outline Width", Range(0, 10)) = 1
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };
            
            struct v2f
            {
                float4 vertex : SV_POSITION;
            };

            float _Width;

            v2f vert (appdata v)
            {
                v2f o;
                float4 clip = UnityObjectToClipPos(v.vertex);
                // in Unity clip space is -1 to 1 so pixels are twice the size
                float2 pixelSize = 2 * (_ScreenParams.zw - float2(1, 1));
                clip.xy += v.uv * _Width * pixelSize;
                o.vertex = clip;
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                return fixed4(1, 1, 1, 1);
            }
            ENDCG
        }
    }
}
