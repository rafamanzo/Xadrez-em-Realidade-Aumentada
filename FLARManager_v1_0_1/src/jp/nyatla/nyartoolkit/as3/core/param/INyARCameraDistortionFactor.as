/* 
 * PROJECT: NyARToolkitAS3
 * --------------------------------------------------------------------------------
 * This work is based on the original ARToolKit developed by
 *   Hirokazu Kato
 *   Mark Billinghurst
 *   HITLab, University of Washington, Seattle
 * http://www.hitl.washington.edu/artoolkit/
 *
 * The NyARToolkitAS3 is AS3 edition ARToolKit class library.
 * Copyright (C)2010 Ryo Iizuka
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
 * 
 * For further information please contact.
 *	http://nyatla.jp/nyatoolkit/
 *	<airmail(at)ebony.plala.or.jp> or <nyatla(at)nyatla.jp>
 * 
 */
package jp.nyatla.nyartoolkit.as3.core.param 
{
	import jp.nyatla.nyartoolkit.as3.core.types.*;
	public interface INyARCameraDistortionFactor
	{
		function ideal2Observ(i_in:NyARDoublePoint2d,o_out:NyARDoublePoint2d):void;
		function ideal2ObservBatch(i_in:Vector.<NyARDoublePoint2d>,o_out:Vector.<NyARDoublePoint2d>,i_size:int):void;
		function observ2Ideal(ix:Number,iy:Number,o_point:NyARDoublePoint2d):void;
		function observ2IdealBatch(i_x_coord:Vector.<int>,i_y_coord:Vector.<int>,i_start:int,i_num:int,o_x_coord:Vector.<Number>,o_y_coord:Vector.<Number>):void;
	}
}