<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes" encoding="UTF-8"/>
  
  <xsl:template match="/">
    <html>
      <head>
        <title> Ficha Mascotas </title>
        <link rel="stylesheet" type="text/css" href="style.css"/>
      </head>
      <body>
        <h1> Mascota </h1>
        <xsl:apply-templates select="fichamascota/mascota"/>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="mascota">
    <div class="mascota">
      <p><strong><xsl:value-of select="nombre"/></strong> (<xsl:value-of select="tipo" />) </p>

      <img src="imagenes/{foto}" alt="{nombre}" class="foto-mascota" style="max-width: 200px; display: block; margin-bottom: 15px; border-radius: 8px;"/>

      <p>ID: <xsl:value-of select="@id"/></p>
      <p>Raza: <xsl:value-of select="raza"/></p>
      <p>Sexo: <xsl:value-of select="@sexo"/></p>
      <p>Fecha de Nacimiento: <xsl:value-of select="fecha_nacimiento"/></p>
      <p>Peso: <xsl:value-of select="peso"/></p>
      <p>Color de Pelo: <xsl:value-of select="color_pelo"/></p>
      <p>Pedigree: 
        <xsl:choose>
          <xsl:when test="pedigree = 'true'">Sí</xsl:when>
          <xsl:otherwise>No</xsl:otherwise>
        </xsl:choose>
      </p>
      
      <h3> Propietario </h3>
      <p>Nombre: <xsl:value-of select="propietario/nombre_prop"/></p>
      <p> Apellido: <xsl:value-of select="propietario/apellido"/></p>
      <p>Teléfono: <xsl:value-of select="propietario/telefono"/></p>
      <p>E-mail: <xsl:value-of select="propietario/mail"/></p>
      <p>Dirección: <xsl:value-of select="propietario/direccion"/></p>
      
      <h3> Vacunas </h3>
      <table>
        <tr>
          <th>Laboratorio</th>
          <th>Nombre</th>
          <th>Fecha Vacunación</th>
          <th>Próxima Fecha</th>
        </tr>
        <xsl:for-each select="vacunas/vacuna">
          <tr>
            <td><xsl:value-of select="@laboratorio"/></td>
            <td><xsl:value-of select="nombre_vacuna"/></td>
            <td><xsl:value-of select="fecha_vacuna"/></td>
            <td>
              <xsl:choose>
                <xsl:when test="fecha_proxima != ''">
                <xsl:value-of select="fecha_proxima"/>
                </xsl:when>
                <xsl:otherwise>--</xsl:otherwise>
              </xsl:choose>
              </td>
          </tr>
        </xsl:for-each>
      </table>

      <h3>Visitas Veterinaria</h3>
      <table>
        <tr>
          <th>Fecha Visita</th>
          <th>Motivo de Consulta</th>
          <th>Diagnóstico</th>
          <th>Tratamiento</th>
          <th>Alta</th>
        </tr>
        <xsl:for-each select="visitas/visita">
          <tr>
            <td><xsl:value-of select="fecha_visita"/></td>
            <td><xsl:value-of select="motivo_consulta"/></td>
            <td><xsl:value-of select="diagnostico"/></td>
            <td><xsl:value-of select="tratamiento"/></td>
            <td>
              <xsl:choose>
                <xsl:when test="alta = 'true'">Sí</xsl:when>
                <xsl:otherwise>No</xsl:otherwise>
              </xsl:choose>
            </td>
          </tr>
        </xsl:for-each>
      </table>
    </div>
  </xsl:template>
  
</xsl:stylesheet>