using System.Data.Linq;
using System.Data.Linq.Mapping;

namespace AMBC
{
    internal class GoodsDataContext: DataContext
    {
        public Table<Good> Goods;
        public Table<Measure> Measures;
        public GoodsDataContext(string cnnString) : base(cnnString) { }
    }

    [Table(Name = "Goods")]
    public class Good
    {
        [Column] public int GoodsId { get; set; }
        [Column] public string Description { get; set; }
        [Column] public int Parent { get; set; }
        [Column] public bool Group { get; set; }
        [Column] public bool ByReceipt { get; set; }
        [Column] public string Code { get; set; }
        [Column] public bool ISDeleted { get; set ; }

    }

    [Table(Name = "Measure")]
    public class Measure
    {
        [Column] public int MeasureID { get; set; }
        [Column] public string MeasureName { get; set; }
        [Column] public int? PackID { get; set; }
        [Column] public double? PackQty { get; set; }
    }

    internal class ContrDataContext : DataContext
    {
        public Table<Contragent> Contragents;
        public ContrDataContext(string cnnString) : base(cnnString) { }
    }
    [Table(Name = "ContragentsView")]
    public class Contragent
    {
        [Column] public int ContrID { get; set; }
        [Column] public string ContrName { get; set; }
        [Column] public string ContrBulstat { get; set; }
        [Column] public int Parent { get; set; }
        [Column] public bool IsGroup { get; set; }
    }
}
