Shader "Donchek/PackedPractise" //to show in shader
{
	Properties
	{
		_myColour("Example Color", Color) = (1,1,1,1) //default RGB color, "Example Color" will appear in Inspector
		
	}


	SubShader
	{
	CGPROGRAM  //Written in Language "CG"
		#pragma surface surf Lambert // #pragma - compile a surface shader, surf - void surf below, Lambert - Lighting model

		struct Input //Input data from model mesh (vertices, normals, UVs)
		{
		float2 uvMainTex; 
		};
	fixed4 _myColour; //properties to avaible to shader function (_myColour in Properties on top)

	void surf(Input IN, inout SurfaceOutput o) { //shader function 
		o.Albedo = _myColour.rgb;
		
	}
	ENDCG

	}
	FallBack "Diffuse" //FallBack shader
}
