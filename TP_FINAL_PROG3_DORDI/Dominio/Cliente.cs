﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Cliente
    {
        public string DNI { get; set; }
        public string Apellido { get; set; }
        public string Nombre { get; set; }
        public string Telefono { get; set; }
        public string Direccion  { get; set; }
        public string Mail { get; set; }
        public DateTime FechaUltCompra { get; set; }

    }
}
