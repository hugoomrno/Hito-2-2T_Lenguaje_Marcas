<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
    <head>
      <title>Pedidos de Clientes</title>
      <style>
        table { width: 100%; border-collapse: collapse; margin-bottom: 20px; }
        th, td { border: 1px solid black; padding: 8px; text-align: left; }
        th { background-color: #f2f2f2; }
        .producto-table { margin-top: 10px; background-color: #f9f9f9; }
        .producto-table th, .producto-table td { border-color: #ddd; }
      </style>
    </head>
    <body>
      <h2>Información de Pedidos</h2>
      <xsl:apply-templates select="//pedido"/>
      <h2>Información del Cliente</h2>
      <xsl:apply-templates select="//cliente"/>
    </body>
  </html>
</xsl:template>

<xsl:template match="pedido">
  <table>
    <tr>
      <th>Número de Pedido</th>
      <th>Fecha de Compra</th>
      <th>Fecha de Entrega</th>
      <th>Total Factura</th>
    </tr>
    <tr>
      <td><xsl:value-of select="numeroPedido"/></td>
      <td><xsl:value-of select="fechaCompra"/></td>
      <td><xsl:value-of select="fechaEntrega"/></td>
      <td><xsl:value-of select="totalFactura"/></td>
    </tr>
    <tr>
      <td colspan="4">
        <table class="productos">
          <tr>
            <th>Nombre del Producto</th>
            <th>Referencia</th>
            <th>Precio</th>
            <th>Unidades</th>
          </tr>
          <xsl:for-each select="productos/producto">
            <tr>
              <td><xsl:value-of select="nombre"/></td>
              <td><xsl:value-of select="referencia"/></td>
              <td><xsl:value-of select="precio"/></td>
              <td><xsl:value-of select="unidades"/></td>
            </tr>
          </xsl:for-each>
        </table>
      </td>
    </tr>
  </table>
</xsl:template>

<xsl:template match="cliente">
  <!-- La definición de la tabla del cliente se mantiene igual -->
  <table>
    <tr>
      <th>Nombre</th>
      <th>Apellidos</th>
      <th>Teléfono</th>
      <th>Dirección</th>
      <th>Correo Electrónico</th>
      <th>Fecha de Inclusión</th>
    </tr>
    <tr>
      <td><xsl:value-of select="nombre"/></td>
      <td><xsl:value-of select="apellidos"/></td>
      <td><xsl:value-of select="telefono"/></td>
      <td>
        <div class="direccion">
          <p>Calle: <xsl:value-of select="direccion/calle"/></p>
          <p>Ciudad: <xsl:value-of select="direccion/ciudad"/></p>
          <p>Código Postal: <xsl:value-of select="direccion/codigoPostal"/></p>
          <p>Provincia: <xsl:value-of select="direccion/provincia"/></p>
        </div>
      </td>
      <td><xsl:value-of select="correoElectronico"/></td>
      <td><xsl:value-of select="fechaInclusion"/></td>
    </tr>
  </table>
  <br/>
</xsl:template>

</xsl:stylesheet>
