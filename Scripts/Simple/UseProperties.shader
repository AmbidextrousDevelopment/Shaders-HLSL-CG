Shader "Donchek/UseProperties" //to show in shader
{
	Properties
	{
		_myColour("Example Color", Color) = (1,1,1,1) //default RGB color, "Example Color" will appear in Inspector
		_myRange("Example Range", Range(0,5)) = 1
		_myTex("Example Texture", 2D) = "white" {}
		_myCube("Example Cube", CUBE) = "" {}
		_myFloat("Example Float", Float) = 0.5
		_myVector("Example Vector", Vector) = (0.5,1,1,1)
	}


	SubShader
	{
	
	//Cull off // disables culling insides (and back, if object is onesided like quad) could be also "Back", and "Front" 
	
	CGPROGRAM  //Written in Language "CG"
		#pragma surface surf Lambert // #pragma - compile a surface shader, surf - void surf below, Lambert - Lighting model

		fixed4 _myColour;
		half _myRange;
		sampler2D _myTex;
		samplerCUBE _myCube;
		float _myFloat;
		float4 _myVector;
		
		struct Input //Input data from model mesh (vertices, normals, UVs)
		{
		float2 uv_myTex; //any uv values have to start with "uv"
		float3 worldRefl;
		};
	

	void surf(Input IN, inout SurfaceOutput o) { //shader function 
		o.Albedo = (tex2D(_myTex, IN.uv_myTex) *_myRange).rgb;
		o.Emission = texCUBE(_myCube, IN.worldRefl).rgb;
	}
	ENDCG

	}
	FallBack "Diffuse" //FallBack shader
}
