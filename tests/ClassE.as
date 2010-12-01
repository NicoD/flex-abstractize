package lib {
	[Abstract]
	public class ClassE extends ClassC {
	
		public function ClassE():void {
			abstractize(this);
		}
		
		[Abstract]
		public function f2():void {}	
	}
}