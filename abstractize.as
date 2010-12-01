/**
 * Flex abstraction support using method tags
 *
 * @author <n.denoual@gmail.com> 2010
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
package {

	import flash.utils.getDefinitionByName;
	import flash.utils.describeType;
	
	
	/**
	 * check that the Object given is a valid in its abstraction
	 * use describeType to do reflexion and resolve all [Abstract] metatags
	 * to have the classic behavior of abstraction.
	 * Abstract metatag is support on class declaration, and its methods
	 * this method should be call at object instantiation
	 *
	 * @example 
	 * <code>
	 * [Abstract]
	 * public class A {
	 *		// constructor
	 *		public class A():void {
	 *			abstractize(this)
	 *		}
	 *	
	 *		public class f():void {}
	 *
	 *		[Abstract]
	 *		public class f2():void {}
	 * }
	 * </code>
	 *
	 * @throws Error	trying to instanciate an abstract class
	 * @throws Error	missing abstract method override		
	 *
	 * @param Object	object to check abstraction
	 */
	public function abstractize(obj:Object):void {
			
		var source:XML = describeType(obj);
		if((source.metadata.(@name=="Abstract")).length() > 0) {
			throw new Error('Cannot instanciate abstract class');
		}
		var className:String = source.@name;
		var meta:XMLList = source..method.metadata.(@name=="Abstract");
		for each(var m:XML in meta) {
			var declarator:String = m.parent().@declaredBy;
			if(declarator === className) continue;
			
			if((describeType(getDefinitionByName(declarator)).factory.metadata.(@name=="Abstract")).length() > 0) {
				throw new Error('Method '+declarator+'.'+m.parent().@name+' is abstract and must be declared into '+className); 
			}
		}
	}
}