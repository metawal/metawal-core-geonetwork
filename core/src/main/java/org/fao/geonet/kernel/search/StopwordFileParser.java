package org.fao.geonet.kernel.search;

import jeeves.constants.Jeeves;
import jeeves.utils.Log;

import org.apache.commons.io.IOUtils;
import org.fao.geonet.constants.Geonet;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.util.HashSet;
import java.util.Scanner;
import java.util.Set;

/**
 * Parses stopword files. Stopword files have lines with zero or more stopwords. Any content from the character | until
 * the end of the line is ignored.
 *
 * @author heikki doeleman
 */
public class StopwordFileParser {

    /**
     * Parses a stopwords file.
     *
     * @param filepath path to stopwords file
     * @return set of stopwords, or null if none found
     */
    public static Set<String> parse(String filepath) {
        if (filepath.endsWith("README.txt")) {
            return null;
        }
        if(Log.isDebugEnabled(Geonet.INDEX_ENGINE))
            Log.debug(Geonet.INDEX_ENGINE, "StopwordParser parsing file: " + filepath);
        Set<String> stopwords = null;
        try {
            File file = new File(filepath);
            if (file.exists() && !file.isDirectory()) {
                FileInputStream fin = null;
                Reader reader = null;
                Scanner scanner = null;
                try {
                    fin = new FileInputStream(file);
                    reader = new BufferedReader(new InputStreamReader(fin, Jeeves.ENCODING)); 
                    scanner = new Scanner(reader);
                    while (scanner.hasNextLine()) {
                        Set<String> stopwordsFromLine = parseLine(scanner.nextLine());
                        if (stopwordsFromLine != null) {
                            if (stopwords == null) {
                                stopwords = new HashSet<String>();
                            }
                            stopwords.addAll(stopwordsFromLine);
                        }
                    }
                }
                finally {
                    IOUtils.closeQuietly(reader);
                    IOUtils.closeQuietly(fin);
                    if(scanner!=null) {
                        scanner.close();
                    }
                }
            }
            // file does not exist or is a directory
            else {
                Log.warning(Geonet.INDEX_ENGINE, "Invalid stopwords file: " + file.getAbsolutePath());
            }
        }
        catch (IOException x) {
            Log.warning(Geonet.INDEX_ENGINE, x.getMessage() + " (this exception is swallowed)");
            x.printStackTrace();
        }
        if (stopwords != null) {
            if(Log.isDebugEnabled(Geonet.INDEX_ENGINE))
                Log.debug(Geonet.INDEX_ENGINE, "Added # " + stopwords.size() + " stopwords");
        }
        else {
            if(Log.isDebugEnabled(Geonet.INDEX_ENGINE))
                Log.debug(Geonet.INDEX_ENGINE, "Added 0 stopwords");
        }
        return stopwords;
    }

    /**
     * Parses one line of a stopwords file. A line may contain 0 or more stopwords separated by whitespace. Any content
     * after the character | is ignored.
     *
     * @param line line to parse
     * @return set of stopwords, or null if none found
     */
    private static Set<String> parseLine(String line) {
        Set<String> stopwords = null;
        @SuppressWarnings("resource")
        Scanner scanner = new Scanner(line);
        scanner.useDelimiter("\\|");
        if (scanner.hasNext()) {
            String stopwordsPart = scanner.next();
            @SuppressWarnings("resource")
            Scanner whitespaceTokenizer = new Scanner(stopwordsPart);
            while (whitespaceTokenizer.hasNext()) {
                String stopword = whitespaceTokenizer.next();
                if (stopwords == null) {
                    stopwords = new HashSet<String>();
                }
                stopwords.add(stopword);
            }
        }
        return stopwords;
    }

}