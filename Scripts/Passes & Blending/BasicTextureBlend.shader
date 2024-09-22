Shader "Donchek/AdditionalTextureBlend" {
	Properties{
		_MainTex ("Texture", 2D) = "white" {}	
		_AdditTex ("Texture", 2D) = "white" {}	
		[Toggle] _ShowAddit("Show Additional?", Float) = 0 //toggle to show in inspector
	}
	
	SubShader {
		Tags{ "Queue" = "Geometry" }
		
		
	CGPROGRAM
      
      #pragma surface surf Lambert 
	  
	  sampler2D _MainTex;
	  sampler2D _AdditTex;
	  float _ShowAddit; //float for toggle
	  
      struct Input {
          float2 uv_MainTex;
      };

      void surf (Input IN, inout SurfaceOutput o) {
          fixed4 a = tex2D(_MainTex, IN.uv_MainTex);
		  fixed4 b = tex2D(_AdditTex, IN.uv_MainTex) *_ShowAddit; //texture multiplied by toggle float
		  o.Albedo = b.r > 0.9 ? b.rgb : a.rgb;
      }
      ENDCG
    } 
    Fallback "Diffuse"
  }