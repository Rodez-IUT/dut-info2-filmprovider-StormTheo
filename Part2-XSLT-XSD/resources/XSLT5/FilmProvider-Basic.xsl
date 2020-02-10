<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html"/>
    <xsl:template match="/films">
        <html>
            <head>
                <title>Film Provider</title>
            </head>
            <body>
                <h1>Liste des films</h1>
                <xsl:apply-templates select="film">
                    <xsl:sort select="@annee"/>
                </xsl:apply-templates>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="film">
        <xsl:variable name="id_realisateur" select="@id_realisateur"/>
        <xsl:variable name="realisateur" select="//realisateur[@id_realisateur=$id_realisateur]"/>
        <table width="60%">
            <tr>
                <td colspan="2">
                    <b>
                        <xsl:value-of select="titre"/>
                    </b>
                    <i> (<xsl:value-of select="$realisateur/prenom"/>, <xsl:value-of select="$realisateur/nom"/>)</i>
                </td>
            </tr>
            <tr>
                <xsl:if test="resume/image">
                    <td><img src="{resume/image/@source}"/></td>
                    <td><xsl:value-of select="resume/text"/></td>
                </xsl:if>
                <xsl:if test="resume/image=false()">
                    <td colspan="2"><xsl:value-of select="resume/text"/></td>
                </xsl:if>
            </tr>
        </table><hr/>
    </xsl:template>
</xsl:stylesheet>