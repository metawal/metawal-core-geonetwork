package org.fao.geonet.monitor.health;

import jeeves.monitor.HealthCheckFactory;
import jeeves.server.context.ServiceContext;
import jeeves.server.resources.Stats;

import org.fao.geonet.constants.Geonet;

import com.yammer.metrics.core.HealthCheck;

/**
 * Checks that 1% of the connections are free of the main database is free. This
 * is normally a warning health check since if it fails that does not mean the
 * system isn't working but rather that a failure will likely happen soon
 * 
 * @author jeichar
 */
public class FreeConnectionsHealthCheck implements HealthCheckFactory {

    @Override
    public HealthCheck create(final ServiceContext context) {
        return new HealthCheck("Sufficient free connections in "+Geonet.Res.MAIN_DB) {
            @Override
            protected Result check() throws Exception {
                Stats stats;
                try {
                    stats = context.getResourceManager().getStats(Geonet.Res.MAIN_DB);
                    int free = stats.maxActive - stats.numActive;
                    double fivePercent = Math.max(2.0, ((double) stats.maxActive) * 0.01);
                    if (free < fivePercent) {
                        Result.unhealthy("There are insufficient free connections on database" + Geonet.Res.MAIN_DB
                                + ".  Connections free:" + free);
                    }
                    return Result.healthy();
                } catch (Exception e) {
                    return Result.unhealthy(e);
                }
            }
        };
    }
}
