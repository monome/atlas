{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 6,
			"minor" : 1,
			"revision" : 5,
			"architecture" : "x86"
		}
,
		"rect" : [ 515.0, 149.0, 640.0, 480.0 ],
		"bglocked" : 0,
		"openinpresentation" : 0,
		"default_fontsize" : 11.0,
		"default_fontface" : 0,
		"default_fontname" : "Andale Mono",
		"gridonopen" : 0,
		"gridsize" : [ 18.0, 6.0 ],
		"gridsnaponopen" : 0,
		"statusbarvisible" : 0,
		"toolbarvisible" : 1,
		"boxanimatetime" : 200,
		"imprint" : 0,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"boxes" : [ 			{
				"box" : 				{
					"fontname" : "Andale Mono",
					"fontsize" : 11.0,
					"id" : "obj-7",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 90.0, 252.0, 228.0, 19.0 ],
					"text" : "prepend /atlas/grid/led/level/map"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Andale Mono",
					"fontsize" : 11.0,
					"id" : "obj-6",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 252.0, 228.0, 57.0, 17.0 ],
					"text" : "compile"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Andale Mono",
					"fontsize" : 11.0,
					"id" : "obj-4",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 144.0, 198.0, 143.0, 19.0 ],
					"text" : "loadmess autowatch 1"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 1.0, 0.4, 0.4, 1.0 ],
					"fontname" : "Andale Mono",
					"fontsize" : 11.0,
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 126.0, 228.0, 96.0, 19.0 ],
					"saved_object_attributes" : 					{
						"filename" : "anatlas.js",
						"parameter_enable" : 0
					}
,
					"text" : "js anatlas.js"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Andale Mono",
					"fontsize" : 11.0,
					"frgb" : 0.0,
					"id" : "obj-2",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 108.0, 102.0, 110.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 270.0, 240.0, 110.0, 19.0 ],
					"text" : "monome.org 2014"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"fontname" : "Andale Mono",
					"fontsize" : 32.0,
					"frgb" : 0.0,
					"id" : "obj-24",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 51.0, 57.0, 107.0, 42.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 51.0, 37.0, 107.0, 42.0 ],
					"text" : "atlas"
				}

			}
, 			{
				"box" : 				{
					"args" : [ "/atlas" ],
					"id" : "obj-58",
					"maxclass" : "bpatcher",
					"name" : "serialosc.maxpat",
					"numinlets" : 2,
					"numoutlets" : 4,
					"offset" : [ -80.0, -64.0 ],
					"outlettype" : [ "", "int", "", "" ],
					"patching_rect" : [ 51.0, 141.0, 315.0, 27.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 51.0, 69.0, 313.0, 26.0 ],
					"varname" : "serialosc"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 1.0, 0.8, 0.4, 0.2 ],
					"id" : "obj-22",
					"maxclass" : "panel",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 285.0, 105.0, 54.0, 30.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 33.0, 33.0, 348.0, 204.0 ]
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-58", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-6", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-58", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-7", 0 ]
				}

			}
 ],
		"dependency_cache" : [ 			{
				"name" : "serialosc.maxpat",
				"bootpath" : "/Applications/Max 6.1/patches",
				"patcherrelativepath" : "../../../../../../../Applications/Max 6.1/patches",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "anatlas.js",
				"bootpath" : "/Users/Trent/Documents/Monome/atlas/atlas/code",
				"patcherrelativepath" : "../code",
				"type" : "TEXT",
				"implicit" : 1
			}
 ]
	}

}
