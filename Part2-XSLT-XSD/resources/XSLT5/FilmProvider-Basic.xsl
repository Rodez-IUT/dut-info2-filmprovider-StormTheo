<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:template match="/films">
        <html>
            <head>
                <title>Films</title>
            </head>
            <body>
                <h1>Liste des films</h1>
                <table>
                    <thead>
                        <tr>
                            <th>Titre</th>
                            <th>Auteur</th>
                            <th>Résumé</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:apply-templates select="film"/>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="film">
        <tr>
            <td><xsl:value-of select="titre"/></td>
            <xsl:variable name="id_rea" select="@id_realisateur"/>
            <td><xsl:if test="image"><xsl:value-of select="titre"/></xsl:if></td>
            <td>
                <xsl:value-of select="//realisateur[@id_realisateur=$id_rea]/prenom"/>
                <xsl:text> </xsl:text>
                <xsl:value-of select="//realisateur[@id_realisateur=$id_rea]/nom"/>
            </td>
            <td><xsl:value-of select="resume/text"/></td>
        </tr>
    </xsl:template>

</xsl:stylesheet>