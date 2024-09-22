Shader "Donchek/Hole" { //works with Wall shader
	Properties {
		_MainTex ("Diffuse", 2D) = "white" {}
	}
	SubShader {
		Tags { "Queue"="Geometry-1" } //-1 means it gets draw before geometry

		ColorMask 0
		ZWrite off
		Stencil //stencil buffer
		{
			Ref 1 //like each pixels
			Comp always //always compilates
			Pass replace //replace other 
		}
		
		CGPROGRAM
		#pragma surface surf Lambert


		sampler2D _MainTex;

		struct Input {
			float2 uv_MainTex;
		};

		void surf (Input IN, inout SurfaceOutput o) {
			fixed4 c = tex2D (_MainTex, IN.uv_MainTex);
			o.Albedo = c.rgb;
		}
		ENDCG
	}
	FallBack "Diffuse"
}
