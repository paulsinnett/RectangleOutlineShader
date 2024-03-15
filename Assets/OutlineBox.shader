Shader "Unlit/OutlineBoxShader"
{
    Properties
    {
        _Width ("Outline Width", Range(0.0, 10)) = 5
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
                float3 normal : NORMAL;
            };
            
            struct v2f
            {
                float4 vertex : SV_POSITION;
            };

            float _Width;

            v2f vert (appdata v)
            {
                v2f o;
                float3 x = normalize(mul((float3x3)unity_ObjectToWorld, float3(1, 0, 0)));
                float3 y = normalize(mul((float3x3)unity_ObjectToWorld, float3(0, 1, 0)));
                float4 world = mul(unity_ObjectToWorld, v.vertex) + float4((x * v.normal.x + y * v.normal.y) * _Width, 0);
                o.vertex = mul(UNITY_MATRIX_VP, world);
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
