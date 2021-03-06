using Toybox.WatchUi as Ui;
using Toybox.System as Sys;
using Toybox.Time.Gregorian as Calendar;

class StretchingMenuDelegate extends Ui.MenuInputDelegate
{
    function initialize()
    {    	
        MenuInputDelegate.initialize();        
    }
    
    function onMenuItem(item)
    {    	
	    var functions = {
		  :item_1 => :Timer,
		  :item_2 => :Rest,  
		  :item_3 => :Reputation,
		  :item_4 => :Vibrate,  
		  :item_5 => :Sound,
		  :item_6 => :Light,
		  :item_7 => :Autostart,
		  :item_8 => :Recording
		};
    
	    var symbol = functions[ item ];
	  	if (symbol != null)
	  	{
		    var handler = self.method(symbol);
		    handler.invoke();   
        }
        GlobalSetup.Modified = true;
    }
    
    function Timer()
    {    	
    	ShowGenericPicker(GENERIC_PICKER_Time, Rez.Strings.menu_label_Timer, GlobalSetup, :StretchDuration);    	
    }
    
    function Rest()
    {    	
    	ShowGenericPicker(GENERIC_PICKER_Time, Rez.Strings.menu_label_Rest, GlobalSetup, :RestDuration);    	
    }
    
    function Reputation()
    {   
    	ShowGenericPicker(GENERIC_PICKER_Number, Rez.Strings.menu_label_Rep, GlobalSetup, :Reputation);    	
    }
    
    function Vibrate()
    {    	
    	ShowGenericPicker(GENERIC_PICKER_Bool, Ui.loadResource(Rez.Strings.menu_label_Vibrate) + Ui.loadResource(Rez.Strings.main_label_Activate), GlobalSetup, :Vibrate);    	    	
    }
    
    function Sound()
    {  
    	ShowGenericPicker(GENERIC_PICKER_Bool, Ui.loadResource(Rez.Strings.menu_label_Sound) + Ui.loadResource(Rez.Strings.main_label_Activate), GlobalSetup, :Sound);    	
    }
    
    function Light()
    {  
    	ShowGenericPicker(GENERIC_PICKER_Bool, Ui.loadResource(Rez.Strings.menu_label_Light) + Ui.loadResource(Rez.Strings.main_label_Activate), GlobalSetup, :Light);
    }
    
    function Autostart()
    {  
    	ShowGenericPicker(GENERIC_PICKER_Bool, Ui.loadResource(Rez.Strings.menu_label_Autostart) + Ui.loadResource(Rez.Strings.main_label_Activate), GlobalSetup, :Autostart);
    }
    
    function Recording()
    {  
    	ShowGenericPicker(GENERIC_PICKER_Bool, Ui.loadResource(Rez.Strings.menu_label_Recording) + Ui.loadResource(Rez.Strings.main_label_Activate), GlobalSetup, :Recording);    	
    }
    
    function ShowGenericPicker(type, title, object, symbol)
    {    	    	    
    	var gpd = new GenericPickerDialog(type, title, object, symbol);    
    }
}