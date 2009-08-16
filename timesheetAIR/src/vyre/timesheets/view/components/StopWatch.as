/*
This class is a stopwatch-like timer that does not use the Timer class and is therefore not dependent on framerates.
It does depend on the system clock, but then again if your system clocks are unreliable you've got bigger problems than framerate.
The only condition I'm aware of that would break this instantly is if you have a multicore system and you're running an OS in a virtualization enviroment. This
is known to sometimes cause system clock inconsistency.
*/
package vyre.timesheets.view.components {

    public class StopWatch
    {
        private var secondsPerMinute:int = 60;  
        private var minutesPerHour:int = 60;
        private var date:Date;
        private var startTime:Number = 0; // this stores the start time and is reset when the stopwatch is stopped and restarted
        public var savedTimes:Array = []; //  this keeps a running array of all times elapsed between starts and stops for an instance
        public var accrued:Number = 0; // this var is used to add up the values from savedTimes[] during arithmatic operations
        
        public function StopWatch()
        {
            date = new Date(); //  current date as a starting point
            startTime = date.getTime(); // time, Unix style        
        }
        
        public function start():void
        {
            date = new Date(); //  current date as a starting point
            startTime = date.getTime(); // time, Unix style
        }
        
        public function pause():void {
            var savedTime:Number = getTimeStamp(); //  on a pause, get the current time
            savedTimes.push(savedTime); // and add it to the array of stored values for this instance
        }
        
        public function getTimeStampAggregate():int // returns time in milliseconds; this includes ALL TIMES saved in the savedTimes array, so its the total time counted
        {
            accrued = 0;
            for each (var savedTime:Number in savedTimes) {
                accrued += savedTime;
            }
            date = new Date();
            return (date.getTime() + accrued) - startTime; // Get all the saved times and the current running count and add them up. Subtract the start and we have total time elapsed
        }
        
        public function getTimeStamp():int // returns time in milliseconds, NOT counting previously saved stops and starts. This is only the time since the LAST start
        {
            //return timer.currentCount * timer.delay;
            date = new Date();
            return date.getTime() - startTime;
        }
    
        public function getTimeStampAsString():String // this returns a string like HH:MM:SS (ex: 12:01:59). Includes all accrued time for this instance
        {
            accrued = 0;
            for each (var savedTime:Number in savedTimes) {
                accrued += savedTime;
            }
            var seconds:int = (getTimeStamp() + accrued) / 1000;
            return convertSecondsToHHMMSS(seconds); 
        }
    
        public function reset():void // resets the stopwatch, clearing everything
        {
            savedTimes = new Array();
            date = new Date();
            startTime = 0;
        }
        
        private function convertSecondsToHHMMSS(intSecondsToConvert:int):String { // utility function to do the math and return a string
            var hours:int = convertHours(intSecondsToConvert);
            var minutes:int = getRemainingMinutes(intSecondsToConvert);
            minutes = (minutes == 60) ? 0 : minutes;
            var seconds:int = getRemainingSeconds(intSecondsToConvert);
            // the next 3 lines are in case you want to get separate strings for HH:MM and :SS as values in an array
            //var returnValues:Array = new Array();            
            //returnValues[0] = stringify(hours) + ":" + stringify(minutes);
            //returnValues[1] = ":" + stringify(seconds);
            var returnValue:String = stringify(hours) + ":" + stringify(minutes) + ":" + stringify(seconds);
            return returnValue; 
        }
        
        private function stringify(input:int):String {
            var numString:String = input.toString();
            var retString:String = '';
            // add a leading 0
            if (input < 10) {
                retString = '0' + numString;
            }
            else {
                retString = numString;
            }
            return retString;
        }
        
        public function getTimeStampAsHours():Number {
			var seconds:int = getTimeStampAggregate() / 1000;
			return ((seconds /60) / minutesPerHour);
		}
        
        // Math functions to determine hours, minutes, and seconds
        private function convertHours(intSeconds:int):int {
            var minutes:int = convertMinutes(intSeconds);
            var hours:int = Math.floor(minutes/minutesPerHour);
            return hours;
        }
        private function convertMinutes(intSeconds:int):int {
            return Math.floor(intSeconds/secondsPerMinute);
        }
            
        private function getRemainingSeconds(intTotalSeconds:int):int {
            return (intTotalSeconds%secondsPerMinute);
        }
            
        private function getRemainingMinutes(intSeconds:int):int {
            var intTotalMinutes:int = convertMinutes(intSeconds);
            return (intTotalMinutes%minutesPerHour);
        }
        
    }
}